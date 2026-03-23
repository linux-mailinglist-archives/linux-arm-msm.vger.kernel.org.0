Return-Path: <linux-arm-msm+bounces-99239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFkaE241wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:43:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7952F21C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB37C3015BA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7073A8750;
	Mon, 23 Mar 2026 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjKRB0zm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3CbPuX/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2528E3A3822
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269712; cv=none; b=VeikrUlJf3FIJ2ZE/W3iEGqwLd5dxHWDpGIlqUAHv/pVBLyg/bZ+bRGKW5vYBqNkieCuhy/Kr99ibLmwvfIx1xcNfWdL8sLY2oCTbAx2ywRkbRhiVusCZWyntUxMbXOs9MXGZzgzMHmzglZbkIv2CUba5ubpxg0qCKQkl8hlx5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269712; c=relaxed/simple;
	bh=C4IWI5Urz4KtuWZUw5D8TCoVH1+d3S44prv1x9Afu9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAHvbHHM8UIsnXcCgNwZZH+I3SFG23Jq595EHLo9wblo1l0cdKEyf6i9L65jaWql1XRpwzs/jZ4/aeVB+1VOqYCp4yCp8ulGWWY9LftRvDiiV0BPl3AQKEBdgvLcQubQeqUItrcRe+yJghqpVFPkobJRvH3Wdd7Nza/3ADOGphY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjKRB0zm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3CbPuX/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83sIc1364318
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nww5aX/HELUKCVBALV6/EosnyDvF7SxfgMm8lU8E2Wo=; b=kjKRB0zmc5+JAWHz
	2OP7xpsF8MLvUub1WowTKazhWRnlfUhbB7gQPhhD4UPUCj5h4EWgsVCtpcERMD1s
	iSmIq2L08g5mL+qmaPRCa3I7gJL69DaUErDz2m+fzznx8k9UrxG8YDY7FWiA9pge
	a/pesCVSuj5UlFMMCgDiQ5m5U/oI5CEDf0rKpIdLtbS/1kjkwrRuypfxz6QsScLC
	27PboHUGa1QQkxsn81qiyjSWDO0ZK1yXL1rpdhGKHd5uJ/Uke7liJbIusUiB1rcb
	PCQYAE2P/f4acAhIZP2QcAqfYa6RPs/e3/lYeXl0LnhyfrJh9S0dPg3RDJps2hZj
	e34BIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p78yhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:41:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ef8c28cso19193621cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269710; x=1774874510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nww5aX/HELUKCVBALV6/EosnyDvF7SxfgMm8lU8E2Wo=;
        b=U3CbPuX/UC3Ejc5oLJ7FsGiIxOV6KJUiFwPDLoXTe2ksnG0yxvND0p+UI64Id7RIjf
         J+oYOcWHAR1xbIyObDGGIcTUjIbd6IuJ5FKaPn4zGTj6dvto/QCLEIXKXnBrexpagzcg
         FnE5qy9dpSXY5lCzbMj1axiReEAC6VeRgPHIP2mwVTllb5x6+3NN3eBlqTj13tcvf5bL
         tjvRGa+J70hBPtqO6zjkuQzzUSK1+BQYZNpz6V65v5lJbEUS8/TMHanGGF8hlRR2M6oO
         HdmRgHvd1AFqU9QtWXBwa+bEaNWg/b2863Dvxi9xQGcBuXRMjBORW6yNzt9TTMoDF3DB
         xX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269710; x=1774874510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nww5aX/HELUKCVBALV6/EosnyDvF7SxfgMm8lU8E2Wo=;
        b=YQksVqR3pHGtNjposrhpQAZ4lXP/sH1LeZNoYMT1GIUM7O/mH0a4cVPUbZsyRe3X7Z
         c/wfhx0pHoiz8TbEcQH026zsVXySwOTda5t3uLZE9XgItiBbMuOGbeAPgIzyKk77zBtv
         KB82jUWhwPqHTXk0+HpA/mQnhA97DjaoeVEUgGT2yJeoT2H5wKHlc2j7A6iOU36qBRBP
         DxuBAiNWM6C77HKpoWnWRanZcce9iecgM3O9dsE4DDd/pMwFl9GgzvseQuKW9J1iiF8B
         ns3tXmRRqoVP1Cbe+wW+2Q60MX61chdTOpp+6QWnTwVGYs8RPh9G2LGEZBCekC3BOO8L
         TCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7asiaPTegkBn5w45NNdGJmS8tF89BjiG7mB8D6uZnV7qatcbCpKtCm3I5yUjWFe9UQYLp2S7zn31buHsa@vger.kernel.org
X-Gm-Message-State: AOJu0YxR1xrcvFyc7EVlkxhR8jTZ0TRKgaUYc3sceiQYBgTKS+cR0NcS
	f7juzqOqiijiJSc8wpMEPCg1SqqR2m6ZDKxQBqKAF7DlnNH6cU7F21mNWicZe+GWix8fpOJYcBQ
	gRQ1hL6yPqhNRv/V4ga5/W1WSvptldbdFATuOiyppxn5UOKIt+nLX7ISvMevFsVUdv8xh
X-Gm-Gg: ATEYQzz52bqheUcHh7vLBgJFCKUR/X0zphJCTS43v0bGkN5pvvLTsfpSss60GmOj76w
	qWwZOcQOvaC4YyPR5HVE01h9jttWCL5Ox8Vsb4jOTuxO3vsJSRf8f0V/gh3HeFQ7YStUTaZhw4M
	Z5dfYI/KqqRolh8Sija/dKSYeSMHrlj75nIbCGDtgKmsKj56F4WZRFXVGKK4dzreQXyeNdB04Ho
	PNx85hfAr2sDe9YBpSrdyet/6wFdrWAWwTXVAK7rNQeGxE/WZ7bGd1CsaEeEpnAToCduUZ0O74J
	Yp4AHjd+kVceIV6d+43ju5ODJnIr9jAVHRSPHQHXOKzKs+/fvjThGXHY4gaOrd9KfDfzEFVM6P/
	RqYNLXIY0Buo1yDNT1s4/pibBjxgJ32AoSwr5W+ggSin6hkDk7PycdV/Z403lCvB0bcBxLyRESt
	SR+pE=
X-Received: by 2002:ac8:7d09:0:b0:509:bed:db5 with SMTP id d75a77b69052e-50b37518e31mr143728621cf.7.1774269709477;
        Mon, 23 Mar 2026 05:41:49 -0700 (PDT)
X-Received: by 2002:ac8:7d09:0:b0:509:bed:db5 with SMTP id d75a77b69052e-50b37518e31mr143728331cf.7.1774269709055;
        Mon, 23 Mar 2026 05:41:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b984bfdb2f1sm311909166b.19.2026.03.23.05.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:41:48 -0700 (PDT)
Message-ID: <3d20a901-0e73-4c95-8721-cf3b1265bac2@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:41:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting
 bias pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1350e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=wBgx0QqB7cFJGvLgnJUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: N6y1jqqvTMUzX8khQlO7gFKpQmOQq8jz
X-Proofpoint-GUID: N6y1jqqvTMUzX8khQlO7gFKpQmOQq8jz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfXweoCyfnw++Y7
 T2T2N9aKbciDpZSDJdKSP+PAixGX5kRMbul5eZ4LZvHOrS/Rh2elbRO5Q8aCir2lv9ujIZdsqMq
 RCU1jbWsG3vC7hGjSiQ1JI5WvVxWi+r1bhE+zQqZeN/FSZYdE9vf6uOIMfzNkgVO5Bpkk5BQQWs
 YAZ8tFLLcwwF6nYQ2BzkMVWFT3nsNYxDyul8NTaLCyCqGAT+3bXVZ5Uvo6St1Z7XCvTYvoHDxDW
 7JZ3QAJRVZVzDjNsMJ0al6RKXyRz7yxGyBh5MGsGdg+qWqC6HhzgbQy/OElfrJrEdIjyHTOeE8f
 RALmY39aS+xZJQAmzqYSVSHmdZywLPHpDECQaOzNnjiyFm5ESHjLb+s/GDk6dRW37dFs6IwbE1H
 eDUmw55izhNu0Wo4pN1zKKDJNpeEhor4k4axjEBl0BUUdgTjxS6hNYokW4Lj3+kQHCupAsWC9uM
 U7v6z9+TuvOD3L6+3Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99239-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B7952F21C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 9:55 AM, Luca Weiss wrote:
> The pinctrl nodes from sm6350.dtsi already contain a bias-* property, so
> that needs to be deleted, otherwise the dtb will contain two conflicting
> bias-* properties.
> 
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/r/20260310-maritime-silly-05e7b7e03aa6@spud/
> Fixes: c4ef464b24c5 ("arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

