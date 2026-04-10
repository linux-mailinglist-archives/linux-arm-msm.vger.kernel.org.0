Return-Path: <linux-arm-msm+bounces-102676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFnsDKzX2GnHjAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:57:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFF43D5E33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A6C1301C6E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19740391E52;
	Fri, 10 Apr 2026 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkdTtaf2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xxsn6grA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AAF398918
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775818666; cv=none; b=Y95x4YrLwPtKh2bu56qwKAQfIfxWj4G6iaFyv6Hm28kMdl/hYxhoTusDJYmtZuIhTfHkPs6KQeQNUZ7PWFq7Lu8OvDWodMSXvbhghlUBmjamdD0H6OW88meBaJNyLMoBK6S8t/6UZCHp/BflDupwScGl18jDtZQhms7DNuqWciE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775818666; c=relaxed/simple;
	bh=+q+1OhDdzvPZ+krF5hp5AKstKd3Qe2GUMwhgQ5xgalk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSBGFQwJ7QY1uNqBUhsw9BhZgp7HbH+0u9vs6mIi5Dvtz7LDuws+5VDY7SVzRzUXht41ukvLMCSGoufF7kSvQhZa1sFRstahnLv0UJQ9pjGpXI4wUY2WPQxqYZJFwgsHhkwbn0K3KeyvtoZjUOhasavBmsmMrUjkVf3h6Zw8moY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkdTtaf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xxsn6grA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAKD7G2698454
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A8SRtNLpNrKw7SKWjiRL/dpR0Kq7TCMarVsjksXHNUo=; b=CkdTtaf2nqO2xGy8
	Bi410T3HIY9W7ZVvMQzBUGspYTiLWjE+ICQmE2j+qe8fXz6QfmQZq7xrJxg9Aeqg
	1bHek48yjW6VfugcMLvj/et5eBFb7eFe2wGQIuJIOwTu+hZBmyIPk0AfWLTyX/vF
	VR7SQ6b286brkyvfzsnCzb5VCVFnwm2luRlVBf1/XfJTz+Wl+IegnsHWtTotUQjk
	1LEqvY635IeSOn0pkb8E3Tx97EwT9YDMeO0fZWwWUAo7L1OnFHZmo6TdO82fCGjX
	aR5wLwGCm34fPAgZheTJFKeYYLdbOSnoDEFBUoio63nlLy7/E7gi3eGuLD42OTOD
	zd8cbA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9tuj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:57:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b250d3699aso39665555ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775818662; x=1776423462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A8SRtNLpNrKw7SKWjiRL/dpR0Kq7TCMarVsjksXHNUo=;
        b=Xxsn6grAo6ebetO+WFMc1Xf0DJQU0m8YRVLRhiJPb8w+8iAeGuON5nJW4SfQXAzCDT
         KBIvFU25YN+K1l2UlbBp3QTXwEAGyA/lekiHSPDOPPz2Jvu9bcftPT42KdP6S3W1MhTm
         bJC4uxhYiVZKQuVPJwTmEvxlfDyFQfAbcmeo8LWnQj7QgylsLhX96VDwtLeKYdCm+Uih
         sy8beDsbsWPRpH783VLkeiwEfmFvIAubjTI0KArO6Bka/ALD9tqSGDKYpccs+BHim5OE
         hvaD+BKMJc+ylVebSxzGgKRMJV6o+s4DKkTlaPoOxzzoJgzChlFvTkhOAtjdrkCgjJnd
         LC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775818662; x=1776423462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8SRtNLpNrKw7SKWjiRL/dpR0Kq7TCMarVsjksXHNUo=;
        b=TrlB1DCKXzVRqJcwrHklM+V+LaE7OGmQvzcU9n898KCUjW9+zu+PqOtVSy+vk7kBF8
         LtbA164JBbOUmtQpPZoMCrNaIQh/UpeTSlaeDDZvkqjbQBogez97oav+hG1yRh7MVDaJ
         qOnOImHKzTEFeMCZmOB9iqah7V2XRfO60PNTOfJflEwu+Ai5VHzm47Y+Rp8OxNNgYBxd
         ZFGoF7dgOpgBzEmYO1n34A6T9cXZEwX754PAADzUtg1fHyrnf3XLFrGlnJdlBpHjGsi7
         h/V4v561RXLGUhjWPASCAY8WStgXYmF9mtfylvyhe7r/YI990ap/q0oqVBASkhMioqBm
         TRqQ==
X-Gm-Message-State: AOJu0YwX0VaAB4OplkOXOW69sIhN0QgolnQhnud/01uS8EKqfur9oUtp
	ndWvV4tlpSi7p5Tlq6kOq5UAJzM4d7Hkl8DD3b2yPS2j1qUKFkWDW21R/UYgrkD2kAyLTeofdXD
	oHvskz470uGactE6ZOyXJpJqc34IoKhf8NSr6/NIjBbHOu5Kj+lBCT0JWBqLXyLqqftZC
X-Gm-Gg: AeBDiesHGDTi/66JPeN7p+3icUGfH45X0z1I36ZNScf0K3h8Y7WfRoyzDpcNQJ9eOiG
	XhccSnQS+1/WuwwTVXpbHK+GkJFrMwExlybvzIJQYJWT8zD66j8Qr64tuFZWdcdaZHQaZQz3fMp
	vjFlw+2fW13+GKAS4mU+dltY/FbXzl5wdCtp9Yi8F4oRAE7tymrTnRtxKOhWb2xbuOqSm0A8AWw
	P+5yhUuxnMML1ZOt5mjyNJEZpM/opRA0U/+rEuupmos0ijgXEd+R1aKtM+x8yG/QydGZFHcc98z
	1D7ob5kNEpUvHbDCGLmfhuajppE6I3jKU+rAoGavodttKMoHGxmODWLLBpdKZvyNpks2aljSOBg
	HqH0W5LolPbnLzpE3vJ8FAwFyEW6eBP2jejKERz3h1vjqi1xrXMHe
X-Received: by 2002:a17:902:b101:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b2d5a2a296mr20063425ad.23.1775818662524;
        Fri, 10 Apr 2026 03:57:42 -0700 (PDT)
X-Received: by 2002:a17:902:b101:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b2d5a2a296mr20063225ad.23.1775818661968;
        Fri, 10 Apr 2026 03:57:41 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4e15f71sm27075985ad.34.2026.04.10.03.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 03:57:41 -0700 (PDT)
Message-ID: <71c6c453-4a6b-414e-a039-80f36e948489@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 16:27:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-5-ca1129798606@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-5-ca1129798606@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEwMSBTYWx0ZWRfX/HxZlmeDg4ZV
 YptQdgqRRDNRTqrsUJEVZfSsYNDfsLKpdio1InA0sVr6NaOBuht5Q2L93/Spl6LvOYsCLD0kDso
 L/1ZQPpHjVmpD1fujiipS2aWJWtk67pEDj8J6QvelxyyMpofVwmSLigxcF2aoM74cDOSCD/Qzfp
 EIHjLCv6OUJ/KTaAGtXtKzXyXEvjN5BK7lwMKle+q6qY7J8jD2Nn5N8NonFNVGqy5rZ61fzWBkp
 WJShY0CuHXcHj5feZZMa3UIJZZdZ4FwXsM+0Pfm2aX+MlKeQKv1XQ1f02Xf3G2lGSsIS10SAJv0
 FxO41TPvsHYDJi8o2HlOHUpXeBfKiM3cPfV/0rbm2ICNUsH74ASPM1Q6yJUViQK/fYb+Z0chDr0
 jIPSisl/1bp/H+VRgplZVK4kSXqrt7fHwCieRUiD4JtGdnwyN0/X2RNpBOcMPaKiW5tlHc5hbQg
 3MMZID5We3CgrlnXvMg==
X-Proofpoint-ORIG-GUID: gp-ckjP01cCJwYnSuAG3vgpWTK99hZnk
X-Proofpoint-GUID: gp-ckjP01cCJwYnSuAG3vgpWTK99hZnk
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d8d7a7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QRdWpJMrku1fmPn5X40A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100101
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102676-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1d88000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9CFF43D5E33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index 487bb682ae8620b819f022162edd11023ed07be8..cb0e554e94d237b0adccb55fa9ed967bae9eea05 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2730,6 +2730,22 @@ ice: crypto@1d88000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			operating-points-v2 = <&ice_opp_table>;
> +
> +			ice_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +

75MHz is supported too. Please add that entry.

> +				opp-201600000 {
> +					opp-hz = /bits/ 64 <201600000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-403200000 {
> +					opp-hz = /bits/ 64 <403200000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +			};
>  		};

-- 
Regards
Kuldeep


