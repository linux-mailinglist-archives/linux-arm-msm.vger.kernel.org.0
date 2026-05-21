Return-Path: <linux-arm-msm+bounces-109013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAhUJEvcDmoVCwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:19:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA64F5A3279
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E70032AFC7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A9437F8AF;
	Thu, 21 May 2026 09:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emEDbAYO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIvC9qpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D5937A481
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357566; cv=none; b=cps0mHc/vh07FQPp5jCb76/K1zvYbrDSqNu8Zjgfpeq3Es+rgsi7rKa4KWtq8Dv2YPeJZCFc/y8wggPFLScnLEvaStFQo9gp1moclzdrzB4l6mhphExl79ESPzfgDWfNCNDgj1KcwaWQQaLcax5SXU2I1wt6TumlVYg8fxFNW/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357566; c=relaxed/simple;
	bh=iwRni7YET8FxX6xbOUKaSqI6koM88c23NPlbPCikH+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpFyDyivdsMqlgz71cJvaTOvo8S4Jc5qzG9/Q/2qL4Yir+rSV8/2t1wxEHG+8AqNv2yUgQTgWdu2DaJotcWdMHKRBYD6sMNegyYd3Y+8iPgxgpMqgE2eg5DoMMClsLIBxHLw0O7nrh844gs8Tl9P5GEgNKbzgF4wVvv03hGczbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emEDbAYO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIvC9qpy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99n2e517710
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=; b=emEDbAYOqzwONIXj
	2TKt4HVKkSyUIZXTclctH5JzJ8AYQAUSIvrC4d18XFwI4QjcPbrhRFGXaqGSslr5
	BsGTAE92gQZSyvfKBkiTLGAgYrVhaArrOCLC6qalWoiEVEVQzUB3cw4Z7X22IhMw
	byOGO5uEup8yfXMHwRgLmbcX9uU4cBn4m8QCywjih1q47e83vjsmdTeUL+TCdmDE
	+VPTDR2IIseqtuLoqnsgmExoHMhfVu4YoF6eqr3kOdfEZLuOfEwmmISr32STBCAp
	p0EITKmZJ9ZVdfzSI3ZLFWtdCLmCc077FlMSskJzpPGay3oQVcEwGyQ+pMfzca26
	yczpew==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa1muc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:59:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516cadbd70eso597601cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779357563; x=1779962363; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=WIvC9qpy0Ub4oqPUH6ciQh4XYVXGBEWCiqhoBwVUktzzgn37VGjTod+sHZylKh35DQ
         yHHlYe0Zag5MdZPJyih2uaIvcfB4OonUkGPTTFshdfuMueA/bpW8rul0KdQATzDWxIHL
         cHbKkxvt1+g5/iFHKoxTTpGbAUV1OzA+HOUzcfXg+bi7PeC/wqfiVT2kaTu0pJAiyg7o
         ZJljga/Ea3h11dlUJQ6RG4n57/0Xc8JUwm4wrUDPmMlW5mEi8wz4rm0rY8gtg1djkR4X
         I/4t+4/OWs52gXQV7B5Seq0Wn6+ftC4uCPEsPxpDk/V9AnU3YHYNGOJE3hoiWqJD1xMV
         B9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357563; x=1779962363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Y0NaPUeaoe/HAAo+5U70JZi2ClUY2ik0lHlKWALqY=;
        b=eQmAaSBlSAi1MuPdnS8YA0dfAYvGh90+9rXfvRiuENIR/xh4Atclwxcp22H3sNhasH
         9J4XEerdwumMeJwLLRfjXVTuVcge/weERiuZuPaGkZYNjBlnUmf+tsKwdRyFVo3Jr/Bf
         PLfZ0zCOoq0IdcyhhrxxF0drDmJVysFXlPO15WGiKCmc713gHkM4USrpAD+y7pyXc05C
         Atz0AVQUMj8A0W3KVO5RxjeewKW85KisDcbci1OPW6M7kfk6E7bMEyNs7kBs2yQzEF6l
         ZcEV1u2zORSM4GPT0BR9xvAt3skL+4VNRTpysxzuYciaoIrAJbw0NVdLjB8G/fTWAPTB
         BrQQ==
X-Gm-Message-State: AOJu0YwQqUi/segm1GioApYZSUkYHb/hgGF/PQA4zwfU4TfJhkMRfQw4
	aR6OFEtjf7AMUQJAXuVveeTNS6hstJ5dRykiLiq1cXOWmSRwJJLnN2tFHiGip1kAOn018uUwhkg
	UxuxHh9yQSg2FyLhWSqxfTEAWh37iriX/UvYVpCeYs6hsmARj0rDFiayVrjN+Y823TEi/
X-Gm-Gg: Acq92OFz20/s9EVL8U65KSiPy1689GdRCTfcyrNV1ev4CnOCRDb5nq+F979ErgatXGO
	UkfUoL4hJbxWW2ZB6lJjx48XaCMdBIJjiCAs8HxWaeXZ/BA+SJmnBw1o8NL5Ss6lxXlfj8VndK9
	DUbE0tmLt4sxbdANuivaePAO/fUWWx4IVyg8qIKw53wtOpN6ogGuZQrtyvFryA4i48S+jq+IjIk
	zaJ5iV6CquJGR+0WpCqgEtAvV/prBDzzEhCzq0YD4HhPQF05zsSNvw5DtX+1ar+cLUk36x6J/tp
	V8tVMFfNX+mp9kL3mlvxGisP4EH2fcwiS6rAgSrT1CFGstpGeh4Hlna7Q0UHzdkSAww3KWkTVSj
	CFK18ODBH93ueSLy28IMHwCAM4LPzLsBKf897OgMsrW+vienSmtqUEp+738iFWN/AiQ6xOs8rnl
	uTeN83EvjPrh/vgA==
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr18783661cf.1.1779357562882;
        Thu, 21 May 2026 02:59:22 -0700 (PDT)
X-Received: by 2002:a05:622a:182a:b0:509:2a92:8088 with SMTP id d75a77b69052e-516c54c365amr18783521cf.1.1779357562503;
        Thu, 21 May 2026 02:59:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a410e13sm23892566b.41.2026.05.21.02.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:59:21 -0700 (PDT)
Message-ID: <e379dd87-7077-4bce-a060-8bf460b27832@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:59:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] ARM: dts: qcom: sdx55: consolidate IPA properties
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
 <20260517-ipa-loader-v1-7-3c3764c1b4a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-7-3c3764c1b4a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5OCBTYWx0ZWRfX6No457JfyyJp
 tYEsdBAc837Wm68cvfvYgWQPkE3azbAhZjP42CLwQm7/gD5IWYwnhsEO3UNT8SvjjTU/YTemJ8z
 FbVQe3qRv8Vf2R1bmMcjADJ2hYwOs0Q4GzAQ7fKjQlm1T672daECMjq9HQolyglMteoW/UK9ZTy
 13VLQgKq0p5P/hJpmu6cMjKUxaXMWhZsqZ20JROtsEiJtNMPurUp5gpJe526rICDQCSJw+akZQO
 Ps2uUovCIzchmoI/LnwAD8vdhAwqA6v51R/UbbO6+sRDiByhwFAmuQDeSTr/NphqsqVhrpuBfx+
 ZZDyydY/LIOrIUzM8Y97GkXVdwUTW10aclt06LviClHhO5wZaM73HvaNARW+aJ462G6Z+YPueyh
 CmMxx5pYmQ3h75MH7Ckk+aqp2dtOSftkAEboBylrkwTnL/vWo9p3A7SEHR7YM7vdIOiqvjc8Lxr
 fqsj9RBS9nJnH+/uxNA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ed77b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2tTTa69PSMra328FOmkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 0W5SCla1cNpBXrneFFdzNyNu94sLQydg
X-Proofpoint-GUID: 0W5SCla1cNpBXrneFFdzNyNu94sLQydg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210098
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
	TAGGED_FROM(0.00)[bounces-109013-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: EA64F5A3279
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/17/26 4:56 PM, Dmitry Baryshkov wrote:
> Move generic IPA-related properties to the base DTSI file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

