Return-Path: <linux-arm-msm+bounces-99620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFekEQ1swmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:48:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B276E306B53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:48:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F281D301CC62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8223E3D96;
	Tue, 24 Mar 2026 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTx/fR+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESo2QFNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1573D3BE659
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349320; cv=none; b=G0B2UPUAjBLnOsQwd+UrzCVOhw/FyTdcGxwExs1aS3LBpITQGvE0YEaEVrW3E9J0jo7u/giOzPXVnKd9nyZ+g79wv5YWeyLy/wNfG/nqV+symu+c5c7L9xZZMpB03bFWlHK/c2iV+douTBrgJiFUV3wiALguOB1lsTMie2Cq2kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349320; c=relaxed/simple;
	bh=lL4bCSw68GqewS1SJ9/DkQuLrzIpX5hWINWoB6HXivk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3/XyTEH7bEUPN5KlwvVwN75YS4qt4o59GXc4nD8552P0y/3/alGjXT7bLYQPSwEZAcQMdskNibcnSXu5/i8Moaagz0jK1/K/hkN4eD2O3izkNWvGWPKKHWXo8hxa5wH9GffQElbkJk2gEsY2TBfrcN1k0t21nnqV6bnJb5f174=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TTx/fR+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESo2QFNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7RBVf2371357
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cmbnbUDG/DeINDzHMdQaJb62KymJ5WVttWBiTZoPIKA=; b=TTx/fR+8Fw4oIrwy
	XTzytTc1BlGCrKqWiVuo7RMKYj7UOYWjwbUJwkT/8OHGc5unsOKEMY2fQB4rP6dY
	uTN9v9eIGAtx1DI9s3pp8SQkVmayI+TUeL+7DwstIqKoXdZCsFQfYj2frgQOxku0
	oUyO/5tTffMf9zbx+neyKrKMgJ/Z8aggiIPwcOOgKf2BgILOt8LI83CcOCLTReNo
	WVIPuU0ORHodmM9LJ5KqK76Hp4EYUW52VGZSjAwx/V2CKM0bvKkgo173GW8dVvtu
	PZ963vxb9ozdsGhhzwVpvGAyNnEPlMqJPE/LJC0RJx8yLe/W6SZ8t0CDjf4IyWyC
	HDeHRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p830qdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:48:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50943e69b08so41599451cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349317; x=1774954117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmbnbUDG/DeINDzHMdQaJb62KymJ5WVttWBiTZoPIKA=;
        b=ESo2QFNauC/AegNNfTmL7SSBZWCUYvSWSFWVm/sY+nNvwgtNeQ/IQ6Vnn2/uQnNBQf
         1TnU3xVBe+fOCieyhfQsnoWY3lgYRLcA3ib3vgEbU/Bqaxh4DZhIBKEtZRY0vrccQZNL
         7dNdHHF09q6kFIxbIsVisZjWFAgMc5XyKKK56l/hdEXeBDDgTZSl6IZoN6aGoESoZQEa
         pxWXepC6pGM3ECntMJgoMAyjDw1BmWDtavCjRHt4y7gX2Apt8TGQav9icgo65ACULuo3
         d2PtzBiaFIGH4hs+gchyBuv4E07VfF/ZEhvzd+EHcvkcVQDHQcZBGNnxi2A3fm4CpIbH
         5SZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349317; x=1774954117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmbnbUDG/DeINDzHMdQaJb62KymJ5WVttWBiTZoPIKA=;
        b=YRXja1GG5PCfJ0mluFTx1q60SJh6W3qLkaduI8keTVVe9BDXb9P4JMizx5krYc75f7
         d9xHs48ZELk3QutPEXwgW2OALtnOt/2KNUXaraFNS6nCRKxQ2RC9rA8jvLIsqahEQkVI
         dZW8TbInF4TbBJIybkWI0ZfnmHsSY+Z+Wabkg/PbZPdDbG/WKPGfInUIFsWR33UpIpcn
         PuHshVNrtzCWyRXWU9tQVCMOf1mdpHRh5W1jdbBdhqa+02Zmn9EZLV/I8BDaAOjOW4sL
         4En8fXRrBgZmq7NtVZCb88aea+whDboE3tz3oy9ysGV1Lwnku/ZrYgihpumXENeKfuzI
         xWVg==
X-Gm-Message-State: AOJu0Yw0WOYkT/vnh+Fz0Wb28f+ZHrngh1WXJJdAP2i5E/1HMTREnZ//
	8yZLl6ZJLWpvQVlWv68310RW2NTWOTwUo7ZfEdXS2+G5Y9fnCCYgjr6C+YK75U1A6XRLNwb3JMB
	PkFX7BshJ8jITV35Whh5/RCLtBIkwHIMV46818ornGXUs74M6TJ89ZrUp2wScjtejzbkk1vVftA
	fK
X-Gm-Gg: ATEYQzzza5OlDMasXjmUBRfgHMGdZsM7vy9OvCuIgkjXc5/11jpW9mwJIF16epY3H/w
	ai/OdZli0ZSF2A7lazTvWLd9RxBLsy3/r912pHG+0ISRZuSCaUljI+xIgAaiVYXqS9xyFIN2Yeg
	+qDTeocJ5MB2pU4N2A1tjP1wHMnFMq4STgftrKqwNvVE1QHgSx20wf+5lCR0anOkzngGNim8nzT
	79DC9+KUa9c8ytjpZ4nqpFpgJym/KWSQP6s+hlQsaA+gvdQ97hgubGQrGV5diUlt/UKSob6ZaS1
	9MxearD3EklgO6oC9/7BwnPzZn08VOEiIVnazBtg+7Hj9Voruh9Y8oOn45Wn2c1kB44UUhn/ZLS
	qyzafKMGuVRyK3J9fvUsVPjEjTynED1tgLv1Fr8MqarPOugY26BuQm2ZLA+ByAUWNLh99H8xwTF
	66C4U=
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175482421cf.8.1774349317485;
        Tue, 24 Mar 2026 03:48:37 -0700 (PDT)
X-Received: by 2002:a05:622a:19a0:b0:50b:3489:5495 with SMTP id d75a77b69052e-50b375a6081mr175482181cf.8.1774349317073;
        Tue, 24 Mar 2026 03:48:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm640162866b.4.2026.03.24.03.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:48:35 -0700 (PDT)
Message-ID: <05d8f1ba-25a0-4fa7-8b63-d07c52d2676e@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:48:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-2-29d70ca1651c@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-2-29d70ca1651c@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfXxDggpBYM71KM
 Xa+2trI7qzmYZhA0DeQDQKkIm5dIZMfkCef85fToj8MGycl6tihYYp8CFa5fSu9HQxQjYC0l7J8
 CmM/hCwnhjvTXc1GFkkMQBmH62IHY/CZlpk+E3A+tr9E7aa0Unejf94n2pfSNP/+TeqxmvfmKm8
 KolWUna84+uDCbUm2MIE+9bF+wmp1nYfNmDDLu0aBREx4CROFN9FVKjTKOflYfCmalA3VQOp84e
 Nt1D3zua5lIOsCaWSD0rEYMkEJTS512uvFG3Rv1XZnrQIT/i/m90n6i+5eJJ9g6ZzfU2WkOi0tg
 IXBsXEr45o8rhqbENFPdh3NUbb0NNClB8zzvU7y6CkbSH03eHXprK+vyXiRqOjVM73k/gfXJKtu
 kJCs9id3OkuH3lRfx309f5CELY7XV3/OuoumlE0GJMQAPnZSzBElSh3fROavRv8qEjHED5RtArq
 uY3q0rSd5OKQruINRYg==
X-Proofpoint-ORIG-GUID: OVMzTgSOMtaQIGgvcia6mtWAor6zpvA8
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c26c06 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Gbw9aFdXAAAA:8 a=zP3sOliNIdXZDfanJcgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: OVMzTgSOMtaQIGgvcia6mtWAor6zpvA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	TAGGED_FROM(0.00)[bounces-99620-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B276E306B53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/24/26 3:06 AM, Paul Sajna wrote:
> Qualcomm video en/de-coder
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 93ed8f240461..87ac41ec2e46 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -580,3 +580,7 @@ &usb_1_qmpphy {
>  
>  	status = "okay";
>  };
> +
> +&venus {
> +	status = "okay";

This patch isn't useful without patch 9

Konrad

