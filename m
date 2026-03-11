Return-Path: <linux-arm-msm+bounces-96989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDPIGi5rsWnsugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:16:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F92264449
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:16:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75C80301061A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9738A30594F;
	Wed, 11 Mar 2026 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hVoNQyhV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEsX6Z3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF9E2D9EED
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234988; cv=none; b=izRRrC9Ssov6H8keY/j1GYVIARaa6wp8dI2Lb2dPW0NGYvbVdqgLtSrwgSHu+sFa/miETuuw1wNbytpnYNZjdnlIUkzEc7Z6wki/u90nHVl5SRjiYCbcpFqL5ZupJ1nvyKy34dST4i3EmVTUNBlfwOdbwOPMkgBqlQC9tXCz62I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234988; c=relaxed/simple;
	bh=BPcBpTSLzR+M0khjQ6a8GS3HOQlO3TRcuDpZlI/Ctc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fi+bGguMXhdYfWk3XS0ABk5LwyBiFNNVxF8hJhmNPaCxgwiMTZE0B4aJi0fhe0u3LAbwGxzl0oUWpICApfkqtlRueszsCiSTbuIOEctPcUHrup16QQzgaxIhvIvtJmA/VuBQ8gC48J1anFkpnHU0bVCs1taNO5TGrwHuuHOMzyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hVoNQyhV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEsX6Z3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BBVsZ72676378
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kgO3mDUXwOAtuCC6J52bMWdN
	DFJ99hNEfn1Q6yBrXSM=; b=hVoNQyhVeWlWZ8PuOGIQk3PtMxDxv+MFV29zpEjB
	7qzYPnl5CjT3ZTU5PeNQ4tUT/CIS04vzFUO/fP7RK7TwVuF4EjQLFMNJRBGb/0MI
	ekI603UrOlXUFpLIe31MkTw9gfX58KHNLVKTIuZVPD9gha1Bhqj+z/jS92N4eP3+
	JB314G2UW0q/VqpTcREUMap9zplA5OJysDY2JIQ4d++hpWWj31usT4TbpBLzrEOj
	HE6NiOFwDPc4kbuIZDtn8tz/EIFtfERf4WJ/BJWEcAGhvvyZyVuoD4q5P6R8qy/u
	bGBNDGfEL7pyemn1mvXUIxbG+bN9r/HxuM3wAyXHRuu5LA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu3cd1fds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:16:26 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5662a21d35bso139682244e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773234986; x=1773839786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgO3mDUXwOAtuCC6J52bMWdNDFJ99hNEfn1Q6yBrXSM=;
        b=eEsX6Z3AcbNKu3zj1PCr+1tDHXqjH3N3F2WRfU9b6M5jyqlFR4sBMbyAZG1wIoAWX5
         rvSR+e3Kq6S2SUgkCeWjvadObI6gsBZo4dv/9PAw8SHp46wuDiTA5NuIJ0GoMiCTigr8
         hoxMD+D4/gv1buy6yiPxy/WtB/oxxDK9NrhUfSYSxG6mKHj8zavulMzhIjNPo7SK/lWw
         jDteRX6wkd1JJrOPwVIbedBax7krIgOW6ITmovuAiCuT61de6Eu+xRPwN3VNsYnx7ArV
         Wu7H1JFfUNy+o5qCFxc0VRfkEv6PhvG0Bz6+VN4rC/ltjA888kkWBGNqYfNGQq72wpEw
         zjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773234986; x=1773839786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgO3mDUXwOAtuCC6J52bMWdNDFJ99hNEfn1Q6yBrXSM=;
        b=bhA9y94aUiKoriDzRsZodWOL+x3lbSe5dl6X4uBiMep/PXAFtyeJmZKoL9AndtZULi
         qZrOmYkebgenIUjhMOAFdQBEls9h7ELoSI5efyEYnfQHW55y8YG/X5LsRjnr2SM/H4UP
         FGVXTsPtZFQ1feOVWYojln6NjNSN0pgrV0AJgBjlTbUyuDScbx/U2gVv1tGLLNV/Ni/I
         HZcF10C6CHsTmKOwbZD13oJZzVCcqwBsCR/giVe7eVupivLSVvCT7DxbylOzod/qFaOM
         qye0dk5AW2X6FS4cxS6XzuQ5KKTo8RhMTNhgMjnOPl803xV4xM2rwuGs5BQdH8Aizrvs
         vDBw==
X-Forwarded-Encrypted: i=1; AJvYcCUyyeqEfvj+7iJ6KssexMXLgUz9QFKimUtIT4if/IWJZoFldthHIkhygYGReOfTR+E3lGe1dHwDVlrYL/kV@vger.kernel.org
X-Gm-Message-State: AOJu0YyXbEckbhpca2QQGMgf8FCRkUDLSnWMqyhg2cb/sWYy+O8hiU5L
	KV0+JN92oIk5O8C15IHAYaL+Bo+LtE7nUg+g1JcSHASuwWGfZ469kp44+6HKZfjOtWRYNj7q1Zd
	cc06hxN08lqDQr9oAghyEC+1Rdq7Ap5U8TpSJd2DhRM5owcNxMU6hlYL0gCigU4UUaUPj
X-Gm-Gg: ATEYQzyG0c9BnwACm5VIjrLCKPupHZAUAFzdsPnFUxe+aZaYNFlqkz6XsGUTKCIfwbB
	PJ3kZb1s9AayiKpBv1wQxrf/4m121WAA7VqSsodJG+Tk64+cU5o6h91r5sK8IRM0xLhnFb5Tdg7
	AkSyTt6187OQbLK6oHagK6l2RSx54G5tqIHQSAqeRzGTSwu2zemJa1ShyrGIxQ9iC0h1+sTz3uN
	ljEhXybCohW4ZV9+9+jpNQxveY+jZVEVEsM/TzSDlRqr7nZANbHMLcjPXCDWmPBYuey7Jtg/VPk
	2nPTXqLAdBS1bUl3ykN5OVyMKg4uqLGbbUuRg2zxupW9EvstPX4E72XmsogUPrpaTy3HSBeakFx
	KLXkEq3VojLUkZJ3J6vK7oYhF8XEYunZxzsr5Zt5ErML7jWG2Y6c9dpEWp6AZxme+WhCK1vxzZl
	srbtN9KJ7WLUJsUM01wM7hqfvR2WAlDUFe0U0=
X-Received: by 2002:a05:6122:e203:b0:566:22e6:35df with SMTP id 71dfb90a1353d-56b474501e5mr980231e0c.5.1773234985748;
        Wed, 11 Mar 2026 06:16:25 -0700 (PDT)
X-Received: by 2002:a05:6122:e203:b0:566:22e6:35df with SMTP id 71dfb90a1353d-56b474501e5mr980199e0c.5.1773234985331;
        Wed, 11 Mar 2026 06:16:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e70d66sm4087301fa.40.2026.03.11.06.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:16:24 -0700 (PDT)
Date: Wed, 11 Mar 2026 15:16:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
Message-ID: <cddnaabou6vdcdt5pt642wbf3w6e7vwisrnczc3b5wsqtliwql@sqvdkq47tibj>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
 <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
 <6ddgxby2wzaa7mfbc64a4ld2rdbo6427csw6blzg5alstvkfv3@usfqftgctnzs>
 <c58b9a2a-8de4-4831-be69-33b158052f54@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c58b9a2a-8de4-4831-be69-33b158052f54@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMiBTYWx0ZWRfX/mV9MCQOtxgR
 xc1gtjvaSsAJ2PTJ9pcravhFvQj+X0P+/0om/bKs83amB/hLnchpH8OfrYIf35yEOSC0EaDnWha
 CkqL4MufAxMcQOMIII8az4jrZDcWy5PJ8mNjwijJWS9yoFmGKwDEwxG0gdBl4UCzC2Me4ccyfcS
 +QYitnqHUMTHC3X2O92dclkGN86Sb9HT7i030Fx5iu+m5EocTKaClbnNh2wYAx1Yr1JessQ6Ydz
 uAAP41Gp29iXwUi+9e0PPdJPCW+k6HpxRE3opaakX8NVgoZ7+Kh88Y2KBm32RLExFaSuuDS0g0Z
 VWWCgh0YalMXAGB4kLNlczpLOPkIDYZ7He7hr3PGPAPi9TIb1V9cF4IoYCahkyC9KDJl8d+Q/kn
 4p3LGYOzBRgxg2hE+B2w6RgIwQExCzETbrkxr55BZ/RLCfl9gFyv5Ko6AZxS+a+1R/VXC2+1yjH
 4e6dcz3ipRJeGbgYH3w==
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=69b16b2a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=sfOm8-O8AAAA:8
 a=JS798oX9D395Q03-T_IA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: 3-21ITBeVBDu-5TMdTpK0ZL0XsiGu7OU
X-Proofpoint-ORIG-GUID: 3-21ITBeVBDu-5TMdTpK0ZL0XsiGu7OU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110112
X-Rspamd-Queue-Id: 10F92264449
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96989-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,protonmail.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,5d:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 01:47:48PM +0100, Konrad Dybcio wrote:
> On 3/10/26 11:49 PM, Dmitry Baryshkov wrote:
> > On Tue, Mar 10, 2026 at 02:08:40PM +0100, Konrad Dybcio wrote:
> >> On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
> >>> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> >>>
> >>> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> >>> Add it to the device tree.
> >>>
> >>> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> >>> ---
> >>>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
> >>>  1 file changed, 32 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> >>> index 7b2849405462..709ea6fc9fbb 100644
> >>> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> >>> @@ -94,6 +94,31 @@ &hsusb_phy {
> >>>  	status = "okay";
> >>>  };
> >>>  
> >>> +&i2c_3 {
> >>> +	status = "okay";
> >>> +
> >>> +	touchscreen@5d {
> >>> +		compatible = "goodix,gt5688";
> >>> +		reg = <0x5d>;
> >>> +
> >>> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
> >>
> >> interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
> >> even consume the former. Trying to read through some of that, I think
> > 
> > I think you need both, take a look, there are enough users of
> > ts->gpiod_int.
> 
> I said irq-gpios was necessary, interrupts is not. The only retrieval
> happens through:
> 
> if (soc_intel_is_cht() && ts->gpio_count == 2 && ts->gpio_int_idx != -1) {
> 	irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
> 	if (irq > 0 && irq != ts->client->irq) {
> 		dev_warn(dev, "Overriding IRQ %d -> %d\n", ts->client->irq, irq);
> 		ts->client->irq = irq;
> 	}
> }

static int goodix_request_irq(struct goodix_ts_data *ts)
{
        if (!ts->client->irq)
                return 0;

        return devm_request_threaded_irq(&ts->client->dev, ts->client->irq,
                                         NULL, goodix_ts_irq_handler,
                                         ts->irq_flags, ts->client->name, ts);
}

I thought that i2c_client->irq is handled by the core.

> 
> Konrad

-- 
With best wishes
Dmitry

