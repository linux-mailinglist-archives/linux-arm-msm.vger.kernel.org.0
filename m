Return-Path: <linux-arm-msm+bounces-109010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PkNHInfDmoVCwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:33:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5D5A35F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:33:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8821E3292FE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D575A38236D;
	Thu, 21 May 2026 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glWLPxZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JYiNodLV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9826B3822B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357521; cv=none; b=gVwTDZSMf1zQiOAxKgq+ogo5MY6gLCHSr+AG/lwZDBpZXa+9uFTj4Qgpg/ir3zOOVU6rGrZpMASiYAxc8Kpp9/2HqAGVKd6vRJiL6VLHsr6P7/+0CM3ZkDZ8bsRq/bDUQOy6ICnlo+UqGwMEtrUIn+pplbYL6rx6m/7Bz+guDJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357521; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unTSYxsjmpribNLOdH5zYZ2hMCg/CgW8dvDVwoCumUxc/YhbwRR05Q4MKa9wNtQZlP/mp/OCMQ9KxawAojja2obBrNtVSOOvwulchDh+m8VC7fN8F/4WBfV2+GS1sB0hA6iGmY9mbBBT2IqQugdLmm5OAn8ZgZhkOtB1MCAwj9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glWLPxZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JYiNodLV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9AN6v1731260
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=glWLPxZEQjnUpPtW
	bSOMo5prMYo1vVUDL43yXrNWq6XwzLYPo+9qLLfY88ynXx9E1n8I1KEam0nTZep8
	3w4HHe71jCul3r0webOC8PPouOZnEZcJB4qX1l41NzYy0tBnImwdi59rWBdXUF2K
	qxQXSznv9GpeTzj6FvK89zTlJ47K4qXSKHpe89yTz9FiuQSAuU9VxpWQlnnlvD+0
	WtafydB8m+XZ5n4mDUhak27G1zRYgVhrCSwV3Q8Q5Xo84ObSiDQRk20CkzxLSVZV
	m4m+TmCJTO4NeDd3h5e7SUvUYGo6Pz5rdece5tmDcnz9DBj3T2Bvlbr4n0/qSgDf
	f+hvcQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f4t8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:58:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514b5cc5cd2so18867581cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357519; x=1779962319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=JYiNodLViRhKjHt1naF3sVfYQWHZlCE4Q1h2WbpNtDanl0LCfsExNKWFg26j7w/yVp
         wwhgmt0yDhHO2VcrudUHJ/Ozv98w+ZBk7sxgh5UYn/NoL/ubrgcVwJI7QdJKDlJ0gkTk
         amOZ9Fy0jZLJ84j1IrYEtVx/5Te0LpGjm4f14bboiTMg2+QVhpXIfXfxKl2zV1EB6avQ
         DKHuz4n7lbSJ40IdnxxVYs8gAmefIidkJTZ4xBERHzNINLCfTd5Acvl/RPplAYTUPTNu
         UcQn5Uwb76bCE6JiM7/NYsKdw251YTp1UCXP9XRiGb6w+JUavAv+YJkp6mqGkVru0Bem
         8jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357519; x=1779962319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=qWDWQ8wHdooMdhVfp2O1/vu/uoGPyk6XdjBlcugG0ip4GNT/4sMpFUz/pNKHBtW6vZ
         YW/Bc/pIVDJQzIKR/5p7Nsyk4738gD/e9+PMnxYFjbjgicMJck6C3ZcCa7gYmyCKMxC/
         aS7t0yePmyk7yCJ9wtioQNJAmYPI7ywUe6sM83kCPiN7nYZH/mXLCtCSA/o8eEUZhZv6
         sFP09snKsNrvku/js0IRlS9BPWQO3JshoQTR/zklsQWQMBrn7o85XnntwaALPuhNBQ1U
         Ni68Pip+/jlNzSv2ezFR+Q7jDKqBnv5tHlPjK8firwn9k6ppElLyuVWORZ7aytAQWT7M
         5x4w==
X-Gm-Message-State: AOJu0YzsDME1mKdmyXav2vbPNmNPqdxcfHQdn4o5WWAiIEFBmdxwV9sj
	LQKzUa1A/x7ittGmpsMgANeq5Ywb+5BaN5CGqUQjYF11ipbrmT/0RI2usR5Vlke+NYQQNAq0hU6
	4u3/fzFSOaNhzYbfn2uXR+UsHo9pK+OnIFVqscumbiBiI2wGEiFUcyqAQS2QErqWQ5aPP
X-Gm-Gg: Acq92OEo8TIBOBOON/0aRx0XgY3wgotlEpr1v8ckKuKxh2T0cO/tdYnPNVYO2bBtOWF
	kgFQVIVi4LDYJHI6Wl2fRjqaqjTYv3SGDvt5B7AoCttn2BMqccyYVbAJJchbfkZdxn7EVybcyY0
	gSs7P1O0/WdQU3TdAHuX7vYJ5mNh+kRhFTT1867PDnkGUDLM0r2kYCPECrHKOdFB1DMCX9iRhPw
	1z9NmUNsbPEt6VJNLX8G7/F5WXq69L70fce1mAth5G3HmsMUXyevVvPk21AjDSalBj3tpybFwx/
	wgNA+cWROC9B62npfOwKqlLVUfRn9kb/32f856lnmf+shvpaEYgFdgONVjh9Nr14Fni58cTrkEH
	oSir+eSP0GyObs2DLQ94s2M63npNtQ3mUkH2oLoDAclIZcHodRGEAwvA9Lm3C7X2GAu6TChQyx+
	RGbpdpM23JHyQ2Gg==
X-Received: by 2002:ac8:584d:0:b0:509:1b76:e9ba with SMTP id d75a77b69052e-516c56b32f9mr18871611cf.8.1779357519014;
        Thu, 21 May 2026 02:58:39 -0700 (PDT)
X-Received: by 2002:ac8:584d:0:b0:509:1b76:e9ba with SMTP id d75a77b69052e-516c56b32f9mr18871431cf.8.1779357518639;
        Thu, 21 May 2026 02:58:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc878912f4sm25602766b.5.2026.05.21.02.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:58:37 -0700 (PDT)
Message-ID: <9248b61d-8fd1-43e6-806a-aa3b270b2ffd@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:58:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sm8550: consolidate IPA properties
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
 <20260517-ipa-loader-v1-4-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-4-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0ed74f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: U6dW-d90Lxb1qj1RDp2pHpOsvt2YMSv3
X-Proofpoint-ORIG-GUID: U6dW-d90Lxb1qj1RDp2pHpOsvt2YMSv3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX04roLiN7ApGB
 n/06MvXt47p1einOwyZ4vW6ZXa69TUlV/aJrt2+SPKEkbi8zOlGZK1UFQaN1UHb0Ou0IxiYg0lP
 0UZrCD9GQsfVxnH555Ug1Y5iT832W3CM9E1I6lKBPwcFD1jeZ4t0AuvjgWg9HsKdY3wWbEeDseZ
 MINM9stU1K1UpaU6u60H/lCi4eDVONytV1CQT4STPjKKREgSMDuVvjFhZ2/ranTQPMb4rqZql5w
 oiB1QLfayOn8RIvFC1pcGd/1YKB9qqdmhdvA5NrEIO2X7v+RKXNr217wCqa2hhyEoSm+wEjuZJc
 q70dksEb+Z9haS/wWeWRGC1plaf/yCQBayNze8KW5uRZGJDjocGeB6mEHiGiTpMoqG+M7S67YuD
 VezbHc2l9Er9O2ulnYMBmgOLOkPHejyZcUz/6xkLA1VdGz9qXMrLpfliJq/J7gwbAXnyZ5yBR34
 jW3QOAulJz5LFdFXPnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109010-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8E5D5A35F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

