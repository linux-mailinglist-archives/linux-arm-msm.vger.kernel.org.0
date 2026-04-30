Return-Path: <linux-arm-msm+bounces-105289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNmSM4768mnxwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 08:45:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4663549E356
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 08:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 078A53018416
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 06:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767873783B4;
	Thu, 30 Apr 2026 06:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ab9JEHLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8hjnirZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B430171C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531522; cv=none; b=kS6OJIy6/+ozAouV8lNV2FxUvKtb5laa29FvFjBPZ4WTddnooJCF8rG6KcbFx3CzrSVbxrNctauzR8o311bZPqTrunftOBbTp3/YVDWtLZmQV6UHecIBy2tnzPrRLfCDvcK6kbHG1405wMPF0XFnKGC4bcxemqG6sqvmgnv5Sfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531522; c=relaxed/simple;
	bh=9SCXbzviY6OXspooHF0q4LaAr+4xBTp28S9n+XC3BU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdFxk50rreyLVQ8aMrIjynrXZUetcS/B7QHsbWIRJymffcC45i/LaBck8XnbUrC4B+csHcFGUVNmE8Br+V+wjyVzGzM3XBwQVj5jVxieD69wAdTc+ijIIBXaSiU6WzcyIGUCKurGejyBZa3ZvXNsov+QjLEzhVUIn6wht8/X+gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ab9JEHLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8hjnirZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNuQdg3636737
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GCqJLduvd/1QTWe87UsZI1ikcjTcDiUgafH+NTT2m8=; b=Ab9JEHLXMRjzdwXp
	XxifaZW3IFGwZ4aIZxhPwzwIbH//rxzJmRE2kiVG9HstjIdOzkP20RV796HraJOH
	u0DwMR1T53DIi/b2WMWMNCvYlCnYiq/ORzqxj5fpj3IdFizPpvNX3gw//wNA9pXa
	1Gt+TxV5KqdVAGgJFrif9qfItQR/U332H0UeYoZNoFT3avPWpNFf7Jj6znV7bSrA
	xPRVmZqUb1asTzfLCxcQIC9tkWHAgGhdS1ZdCxAZe5Bom8jboc81K6MI0eSohTGd
	vG1e7TZBJ2zX/eqYsAfgQ4HHk0ao6hLUQ7BP3moKCmNLY//as7l2ojeK3BRa4Wo6
	anwp1Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3q17aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 06:45:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c797efdaa9cso282744a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 23:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777531518; x=1778136318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GCqJLduvd/1QTWe87UsZI1ikcjTcDiUgafH+NTT2m8=;
        b=Y8hjnirZ/x8HEbDX5hcq2d51I+uejXeXApakT8eJdgp/cRZY4sPxZjc38t7vO5uElF
         5DYfQWYNL8RyXVwFWENXJHioMFTaCB0KSAyed5RdrD+J6JfHlmceXJ0MhgWbagUk+jvY
         rE7DtDtdPFCoX06hSoBkQZkrZ6pTT19gHVz4Ci/jt8b7T185sBXsJQq4QblMwQCaoCyc
         oKlRw41rbwkFOVJcge6b+6j0fHPQ2TiEJFSLMgVRcxuY5dOVN3LKhYiCwMjUgGW0XLq4
         b0iwYeITDO8++Ax4SycpfJkadjFnPc6nkd/BrwO0kRqPs+fOKniRFnum411wp9TgFWTP
         Nbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777531518; x=1778136318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GCqJLduvd/1QTWe87UsZI1ikcjTcDiUgafH+NTT2m8=;
        b=jWeRa7ToFTSir22PqZSvmOGBrMr6BsYEG8TR1OF7xhS8ek2bRdvLH5jk5Nakg/0bRu
         QaHLpbvMdW7HN7uySQDdlsl3oJ/mCjuLR8w1M4ocANfiN05iQ4TmFQLPTjJKbC8cxtoB
         xsp2KTobLB966PE/pNxlWSvktsAWDGnYI8GZhXKRsbZs4IRZoAhAMLGRT8jRm7sGeQV9
         NU6Q6eHsS+1KvDDQozexcOtUcYH2d1o6NB/25xsgcu35wblstJMA513V90cFPohkk/Un
         U4AhiWx63Ivm0mY6syErDxtPzBbjx8UHA8iwm/NEJo2RoYLEUdqQJBqzddsuuJIZfLSC
         sClg==
X-Gm-Message-State: AOJu0Yz+0f9TQfYC292e+UrwL6JZ2XK8vmDZ85Yitd+/9cwfws0fuT/e
	Cn6LKqzU/bmAx5WH9GELWLS0lsfE6t4ujcnxkx06F6Dfp+dctEqlj1NSwzoe1tU5QeOvsw0pNia
	h6gi2h+3GbEWhnK6r2gSmu+OPY6VBVG/dx3KMNcTlA6W0qqPAGTsP095YwXUVCAtau3IA
X-Gm-Gg: AeBDievR8BLu5yi/wCOjiX0kTh9kP+rIKKd3G8ZN8drZal/KxzdCp+07xWtn82alGhf
	/pcZrNa+hX5b4MUZaTzkcwLvIV5ZGFlduG4quY/Vi6wqC+Aztnz8AM9hG8rNVJszu0OFBm7vrG8
	9gd6E9ZqdxuvqG/HwBSWg5tmXX1SIfqhAC3zIKT36uUi+yjtjGqdGpw7Ml3nS8E3LblX55EWYNn
	W2E+H+qkSiP4kRzbDoZiBHnz5USUBWSeaONXZK73H/FTKteYbTVnrW5wSnVnC+UYZ1HEV9sYi3B
	JxrJZX2UPMQ/bEBtsUZlwUkTIY89OW2GHnt/lEXUyRJiVbLRLKKaFsAhQyW7k7WCYiN1OU42wN9
	0AKlZdbKSBHwtuDDZySrerfQkCYvrRKflKpmjRrv5RRLcz0fvrJkUCWDr7z6Okw==
X-Received: by 2002:a05:6a20:a120:b0:3a2:d79c:4161 with SMTP id adf61e73a8af0-3a3cf86fe19mr1867955637.47.1777531517759;
        Wed, 29 Apr 2026 23:45:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:a120:b0:3a2:d79c:4161 with SMTP id adf61e73a8af0-3a3cf86fe19mr1867919637.47.1777531517182;
        Wed, 29 Apr 2026 23:45:17 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5ccb1fsm4173594b3a.17.2026.04.29.23.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 23:45:16 -0700 (PDT)
Message-ID: <e8c670d6-97f2-40a4-8e7e-9b7857b60ad7@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 12:15:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tJObLxJGCWKeuSKuLZIs_M2ok6kszTg5
X-Authority-Analysis: v=2.4 cv=dOyWXuZb c=1 sm=1 tr=0 ts=69f2fa7e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gK-aurLV-Wj7dvaEeU8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA2NCBTYWx0ZWRfXwieuYt8+x5Ub
 CUcYaTYwL2U2uCQhvbJFRWUiefK5wg7OIcuw59EfjI9f2j17ERjNKpULpkZadaIwVxV+MAp0Xnw
 8A9wPEthtO0WQPj3zT7xuTEr2jH9yp0GHuL/uH8ZX2OwORudK/xt1bM/xkhzVGS9nrlKP+r2NZ/
 d/JDXqKAaFX6qcnNaCiFrLZ9IA6Lk2xtFZuCQvb/M/EXz9DY239D6O826wnY+p1b8+qbsL6temf
 oTITMwKDdbo7khqkeOOyv4qu5+5A5294/+VE66KT7eXmtiytRksokglO0+WiiCVBkX2HuCLo1rN
 NEcZkf4WjUu1W3RG0k3DLOQkYvYyVjya15sY7MoXmavu8vOixbO0hIgFByHgltZw+sNXZe2leZn
 0sRbLDCOfZa3kvkbys2TaOyZ3Qsf4grqo/Bi8vvCoJEIVnSQNE2EyHV8lzhbsHAMlUszZEIbUIm
 iQUc2Fx4Y2pvNCk85wA==
X-Proofpoint-ORIG-GUID: tJObLxJGCWKeuSKuLZIs_M2ok6kszTg5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300064
X-Rspamd-Queue-Id: 4663549E356
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105289-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/30/2026 11:24 AM, Sneh Mankad wrote:
> The wakeup enable bit needs to be set irrespective of the SoC using PDC or
> MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarded
> to parent irqchip.
> 
> This is set only for PDC irqchip using additional check skip_wake_irqs
> making it impossible for MPM irqchip to detect the GPIO interrupt during
> SoC low power mode since for MPM irqchip the skip_wake_irqs is always
> false.
> 
> Remove skip_wake_irqs condition when setting wakeup enable bit to allow
> forwarding GPIO interrupts for SoCs using MPM irqchip too.
> 
> Fixes: 76b446f5b86e ("pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits")
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 45b3a2763eb85405fecdd4770ba3d4ab684563f0..96df8eb8f5d3f3bcfe165ac02a07414e491f1178 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1247,7 +1247,7 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
>  	 * While the name implies only the wakeup event, it's also required for
>  	 * the interrupt event.
>  	 */


Pasting full comment from driver, since this is not visible in the diff.

       /*
         * If the wakeup_enable bit is present and marked as available for the
         * requested GPIO, it should be enabled when the GPIO is marked as
         * wake irq in order to allow the interrupt event to be transfered to
         * the PDC HW.
         * While the name implies only the wakeup event, it's also required for
         * the interrupt event.
         */

Can you update in the above comment also to mention both PDC and MPM HW.
While touching this comment, please also correct spelling typo for transfered.

"transferred to the PDC/MPM HW."

Post this update,

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik

> -	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
> +	if (g->intr_wakeup_present_bit) {
>  		u32 intr_cfg;
>  
>  		raw_spin_lock_irqsave(&pctrl->lock, flags);
> @@ -1275,7 +1275,7 @@ static void msm_gpio_irq_relres(struct irq_data *d)
>  	unsigned long flags;
>  
>  	/* Disable the wakeup_enable bit if it has been set in msm_gpio_irq_reqres() */
> -	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
> +	if (g->intr_wakeup_present_bit) {
>  		u32 intr_cfg;
>  
>  		raw_spin_lock_irqsave(&pctrl->lock, flags);
> 
> ---
> base-commit: b4e07588e743c989499ca24d49e752c074924a9a
> change-id: 20260430-enable_wakeup_capable_gpios-cb9439ae8772
> 
> Best regards,


