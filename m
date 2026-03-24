Return-Path: <linux-arm-msm+bounces-99554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HDXEEqoXwmkgZgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 05:48:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AB6302128
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 05:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D74C304C056
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA1F271468;
	Tue, 24 Mar 2026 04:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfwQtmA2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqO4ukrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4CB23BCFD
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 04:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774327712; cv=none; b=apSBGxTapZlT82oI+eMuxLQgjLbM4f+FXO43dM0GHKQPQJrWNd9Rb7ZS9zTui0s9uMyIZ4T1rrHchroXbIQRw5w39UCHDW2HhKMFgIm8LcexzkkzWf54K44d4cnzGs7E+ea/wGweXpBKy4rO5zhRU1lBwxpZ3JhDoKgqRmjpbx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774327712; c=relaxed/simple;
	bh=MqY0rvVxZ8EWepxH1jMTKMbCOC3ejPwoTXI2X/mtWe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWchz18/hb9LsOqH+vabT+mkO0SptrY8I8tuSeblhKMcTP+rDat8bnyvoKlV8NxgyI5xAPlTrfzpDsksNaEekMM/Oj+JWTGNdhibXE4rhdwVmeIvw+6MBy9SiRrclpQcA/BeoOpM8W00Eq33SElnVL/iOXRMR1zMZDMmt51gU70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfwQtmA2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqO4ukrt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3WKDT3903726
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 04:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zeigFvaue2fOm1v1THIQ2tyCHptET7HZIXbAdvlVh1g=; b=DfwQtmA2Tol8kT0p
	AyfPrBdbO7Pg7VbmAULGksQZ6QurwM65gWFE7oNJkgDyzwKoiVeXJLGLiNMwYDw7
	P+eI/Aqs3BZsdC5v97cUxj0NqiYgBqoERnwM4UpjDhd36IIpBD6BAQwO1OLCq3DH
	NoHgCh2U125+kq8tAXfcqg9F7YZe4/j5TGinmJ2UwkcLCD+T/7qLd7PRlgEx0bLq
	wxQ1C0I25n2+pZSHBg80E34lf0IE+gDgHsQ+8YgC306yGx/3rsqRVP6Twt2cR8oJ
	ETh71+liKIfWTefm08atbUCwZZbb+bKwPe0lxI/zFjCGsd9xTxTdPKZEJbDrpD03
	6BAcQA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0g727-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 04:48:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b9894f9ceso6077591a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 21:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774327709; x=1774932509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zeigFvaue2fOm1v1THIQ2tyCHptET7HZIXbAdvlVh1g=;
        b=JqO4ukrtShsLrUtUAa0RKlwIXTo+wmaNt6wi+/OC6TUOZWHM6uXh6f51fjUWv9Y/nv
         O/mKVclMwIJJErLx7fuoDgznPj9/h2kKvmJzp0hsk/FxjIkIbXIhvtXr2H2kDq+mjx27
         Wh808su2t9gjAcARo6OjIPG4wV8aVmdDWtubMdVgD45B78Cv3C7DFYjNbDTD7c1jc4r+
         T47qrYmULFMxHdsfBzdMWKfc9X/EAk6k8fLlEGUvX69qv6pSviFx8PWkxaxgvUk5SQZn
         d4/WxWEIvawNLEVoO/25NW4DOLbkd03wPGZi6dYLFe/gBuE9fkdln04nZnMiMGEmVYsC
         25HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774327709; x=1774932509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zeigFvaue2fOm1v1THIQ2tyCHptET7HZIXbAdvlVh1g=;
        b=r4c4B4TIvtxkL+od/pHL+HHlqYxqFPQrhVfhLBCwKIjzSLny03787hjiDy7vcDWqw8
         T7MPDnXikEsgVza0XP9yyOQfoBf+Ds6lloKDBTOiMYVDe8nYkikZGw+yA5siA5Dh+iCQ
         YQwZRLK/MDjn6s5zhTDNpTSo275xOkKToQtW1AQHx/7SOXvzefJox/fAnWlmCR4CwEB+
         MCrjQx53Gebcp2RuL0VDJckQw4DWzjMqrfDd1GqbmWuQ48FRyWv4OpzLj8UGGWyzGDRs
         YI2PvPIiMoRDbrJuORgxo3F+l2u4MP12NXSaBmiVvPHHsrwJcrA8yLP608FN7iJ7Mrha
         EHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjniBt5W3BkLw//+1XF/qSoaszL9dwxapqrD5ETrO5fFVJVvOstb3Y4wljB2G0cqXDOvFlBkiuH6KjDMrg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0OQsAtIwTD/p7efQHlBfjGhpsVsyQUcDucUgccyq4vn/piB6F
	Vzzb31KP5kP6QC7VBjac/0CwlfQKjaJGbGvlfgk2BpXksmnPPqqb10TV/qA6pFkDsS6IjM+qpIm
	+oa0nxt436WIKHDT2ehtbZgvN2z+HZkU79E71IsVqt0/VE0EzbosvMYQNL43j8EApJ9bl
X-Gm-Gg: ATEYQzwGLB9k65AEt6qXUnUaagfMaSGXiyKg8/PmaLseLAniLDIm+RyNsMCtUU3KyZz
	SDTF8q5FyzG3Y0BXZx+Xr7R/dbPKfUnPgJiWXHcclEv7MJVz2zmQwp+TMjzpzgsTdlVBJjrMdH+
	ycA4UzJAQsbLibTzwm3a6JKbTFL3/byW4HqYM1ijJkfU1sVGjKGp72WzVVlt4xGKPEorXENzwwA
	OW+w9AUF/LqzPhh4x7ddsZE7COAcBpKGwCDH6tWKLzCER+4ojS7Rvwxf2f1eZvSUs6aG5hadNYv
	Kk+S70ebnkHKwkXtnkQOX6iWJMm4yoSThQ5i7sCBTqAR0xYyw9cWcyBjRFPrE12Dx8XTnZggJiL
	6etOfxQwg6Ipp309WY68p0du51MspvFJuU9QfqDpbgfdXR5IBWwhG
X-Received: by 2002:a17:90b:5108:b0:35b:9cd5:232e with SMTP id 98e67ed59e1d1-35bd2ce4493mr13430859a91.29.1774327709468;
        Mon, 23 Mar 2026 21:48:29 -0700 (PDT)
X-Received: by 2002:a17:90b:5108:b0:35b:9cd5:232e with SMTP id 98e67ed59e1d1-35bd2ce4493mr13430834a91.29.1774327708987;
        Mon, 23 Mar 2026 21:48:28 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c017477eesm386657a91.1.2026.03.23.21.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 21:48:28 -0700 (PDT)
Message-ID: <7d797c67-25b6-48c9-b98a-4545de86e45b@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:18:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: un1SfLCgvrw5sKNs-6eq-FC7ygSgwuJl
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c2179e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SBCaeXWvHhY2KLIX7PwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: un1SfLCgvrw5sKNs-6eq-FC7ygSgwuJl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAzNyBTYWx0ZWRfX2JtJmfDpAx3Q
 DmB8DwjMecSYK0GrOepPuurMx8Qn8PncuWjjme27MGv6ilmbSdzjDoqptouKw/j+5jehZmDfGSI
 znbwPTkG1dVWC3yW/ptZrkVMrw7hBkmsnePP/cwEo0tJQgqPx/QqlayrZ7DnvFT8u5JIBVIzeHi
 p+CZhDq2PLf708O/6rTvTV86weg1YQ/9eb3IIKZUJbzIvwTIp/4PAE3luoUV20zWoZO9PK3zRwC
 tkHW/g/W+b+O3DL3hhmj8h93OdXhmB4IZCNXUjzScnka5LiCi41jqafUJSeQka124CrEw2NOmV7
 FH7VjwXp/5BgJ0GUfhTqvVwuv+6VM4kUCLEao4R17mVGCP051ThUmd8ru+9gkPgB5fuYdkzqMaf
 C3Vi2ZjaAeuxdT3kDtbsnMPUdAblMHdoijNVF8mSTFosZ6+r1O5OAsZeOyDIDL+Z5oPVxYdnPUl
 osqTi2g30lOUEQMAaVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240037
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99554-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69AB6302128
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 2:47 PM, Harshal Dev wrote:
> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
> de-coupled from the QCOM UFS driver, it explicitly votes for its required
> clocks during probe. For scenarios where the 'clk_ignore_unused' flag is
> not passed on the kernel command line, to avoid potential unclocked ICE
> hardware register access during probe the ICE driver should additionally
> vote on the 'iface' clock.
> Also update the suspend and resume callbacks to handle un-voting and voting
> on the 'iface' clock.
> 
> Fixes: 2afbf43a4aec6 ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


