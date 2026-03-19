Return-Path: <linux-arm-msm+bounces-98821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EAbILhVvGkXwwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:59:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F552D1E45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 20:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26AC3308B402
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 19:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DE9359A6E;
	Thu, 19 Mar 2026 19:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igCKvKmv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IRs4nQd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D106338906
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773950271; cv=none; b=hM+eG6ePSgQbZQxdTSWI2kx3CgmhURryThtqzrzZzqfnlj+LiDdLCvRMMXBnTSNbh8IA+Q2bfblfx+VTjJQuPi5hbML8/jFOb9alA+NnAU+byd6XWdewXIodGu21rWnqP2+fbuCwFOoc58diIF1d4VCspjFORlTL5/qP+kjmKq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773950271; c=relaxed/simple;
	bh=QTwvb1ZJT3oJv5zwjRyjKoW8qMSMYBlXk2HpDND/G6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQof/+YwDYKsONjsx7Q71jCa4wertV8A26+vblIwBr69jK++1di/6nwrhPsp6GB3Mri0x6aBdvQ1yNMRS4MpdcyXjNHWCc7uvp4sE57y06vZPVvWylkmdi8lluRIu4+D7ZOpB6rhzbHEGHf1jZDRu/6h6cTdni/Q69PUqZ6bRy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igCKvKmv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IRs4nQd+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JF2ePZ1567799
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rk3f6EEHA5oOnawd7HAGIDoZ
	n7P0Q/hRPCGN7St7thE=; b=igCKvKmvZx69PZpa46RBdOuaNrSzGMtbS5Hva5yH
	WVEJ4tJxjBs74NZx0J1pd01wSYugVB0ZxLlsBeJAF/kX07MdgQA1k5nxIr2WK4eX
	FjTwcBwpU5ARlc92fl0tpMpqnC99M8zB5NjG1YUL1PD7UC+DtKm99ZCwMx/UP8/d
	kkx+znJ1kD6okUcdo2rTMeMlzchkcEde4YbNLfhalxTxqmC6SG5qVY9kx/YRSDVu
	dLjkuI5lXdhbPNJ0oRzYP/oOfGTD8N/IOIbK/o39TQBQQaUDY0fXrGPv5vqdHQuG
	ySOl/xCkBmqoDQmj7n1lF2lLJSCo9wFNm9G10uahicbwrg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxjt5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 19:57:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509044f54aaso94291501cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 12:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773950268; x=1774555068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rk3f6EEHA5oOnawd7HAGIDoZn7P0Q/hRPCGN7St7thE=;
        b=IRs4nQd+p7hvbteStTRq5OEMVY1qhBdXx0oW8zlGVnjvauq3/STwpmjXI05/gVWRSu
         Kq9ZoAb90pvS1fr/nHXauF+2SyjngkNz1byXyC/ZSebBrhJJO9KElQIvqEF/9O+vQpxM
         eJnHzTJQ5tMsTJck9BbAoRz8v/uth83QUAPedRCY0dWImCKpIivWz0w4o+nAkJw/5wFS
         3G0PYE8g1/zWXfKpMn+GonNhuTuHb2yPz+W5ztrs0EUcMZdkWNROmhMPSoL6slDWC+sW
         fqm1ZsTFyn7v+gX7bzhA7DJ3f0ugItj702XTEj/m/mjytQWi2M3K8bHKyJT8i5jLXyZP
         Q8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773950268; x=1774555068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rk3f6EEHA5oOnawd7HAGIDoZn7P0Q/hRPCGN7St7thE=;
        b=Ufx7O7YT9LQKELz5lnbzKL8RaDtZgORNARPYrdLxfcP886F/voN+/kGZtv1jMx83lc
         0XlctCmTnCgVhlzUWkRXzAu6MLoYt06j++xBZGvM19c4RGVw5jxX3DeJdiXm/bvQcRVK
         MaM72dxFXPH1ugUdLpSFdMiiLqlr6PyZLca+sgmHqum4fhV2gKPnZJf43wXKhhrcL3dV
         Y9Bl9JQoJHL9h38Lo75qIi5hjVVkU4i/uZoj2sFX/X7qDacxqJaUF2dZkqsr2XYqxjCZ
         nQFwJAsq9uQ936lEkDvL68OkQ36BcLjITeS7uY1JxJcVVGdgoT1yRcUJVRkRe510L9Lm
         BMXw==
X-Forwarded-Encrypted: i=1; AJvYcCVfcHdrwEWfDxmm/kiTjuDQWWQaMsFTYKSnisNMhLYSiGpBnP26yPwzPE4vJtmDMtGwhqDB7rublZHu8AnO@vger.kernel.org
X-Gm-Message-State: AOJu0YwDY8d+acKJZTEtifL+56oaPWQaqs6QO9GAwFf8XyJqYHMdWklg
	4wNb6D1SxWZm5IbrVdJsFAFJzEkfUomCgwVewsd8LyDhQJO/OnKJTGmAWPIwoptAqq8ZEnuP4gm
	Usgu03jfiZ02rauKLg29u62f/bxoHGfes66YRhM+jiEqxH7bgyvNBO9XEoskmWl9rqrdOF3+Cac
	0X
X-Gm-Gg: ATEYQzyCWAykxgxe98xJcHYK8lp4lDZ03uopYV9QG3YzAKQMCqr8RK7QzWqWZMrpeiY
	OTGDMMA49Wf9PqmMlVvRK3x+QsqpM12eJqr7NZJdDgHFnyxXO+n6mIJ28Jd8Uv53gMaQPacXQy3
	BGMQbeZ5rFD0SSdOcirU/NsKsr/zkoehh7+94c6wMTiZsgWMAEjYdc721Btby+EOBlJlz7fNbun
	OXbnregSRB/QLlwUVMvIxmGapZi9/O7HR1HldrW/mMyKH/ZOzj2x0KcQ3EUqVTt4ov2R8ljFFbV
	A/Xr1JPv6eepsFNK/+GKOiYI9PkWpnVLMG7uNvuh8ox+2X4lR1nCSg2vHj9WdMIiAGf+d6DCRNY
	UAWUBT5NuRgzGnPkAMkYBfHzvrOv7n0U2unI7SfeqLB5HxCcxGv10KkLpw4vA1gSskZJWLcO96Y
	vCs4nKl7/z1cvhHyadFKPRa8sD7OUg+vb1nR0=
X-Received: by 2002:a05:622a:4185:b0:50b:2763:2bc0 with SMTP id d75a77b69052e-50b3738f13fmr7762501cf.8.1773950268414;
        Thu, 19 Mar 2026 12:57:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4185:b0:50b:2763:2bc0 with SMTP id d75a77b69052e-50b3738f13fmr7762151cf.8.1773950267968;
        Thu, 19 Mar 2026 12:57:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aac6f5sm1009811fa.33.2026.03.19.12.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:57:46 -0700 (PDT)
Date: Thu, 19 Mar 2026 21:57:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: qcom: Add support for per port VBUS
 detection
Message-ID: <pvmxnx7fmcdli5qoanmo62mmoxd2vslh2ujbka4cfmxyo4hxl6@dueec5hukqi5>
References: <20260312-qcom-typec-shared-vbus-v2-1-99ed9e500947@pm.me>
 <1fd9048c-b0c0-451a-a6f7-e5474352d118@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fd9048c-b0c0-451a-a6f7-e5474352d118@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE2MCBTYWx0ZWRfX61c8DvwjBNIz
 5vtM3FlTAo+RsS6sgwAr0KHUuchSQKoWm330JwAPhS3dYq20a4huy57lk8GRFA87PCcIZunoBjn
 vMYJ7bQErxLPPVCKGBGGeJiKs2oeBZMAERZl6oIXtyR047n/yMf9TuK5rCdsrz9nUugNxnyUqCA
 w6niQ/n+FWBY+VimNrYbT/gEw2b1++X1a0KRW+MN0kxMDcJsPEagRgY8fITF21qmpRGXgoC/77V
 nLyU1KBlHX+udfOYbeqrh0qgsIze0+t/EY6wd0BZ1++uoqN4PnB3t+0cdkZUBVE3Ja2j+9FNEOg
 SEGm3EfI8ME1k1q6lZfBr7Vnu6itJTpDAZXSJTHY3TbPww7f17JhGAoMq/e+zxdKj+qnOsL8N15
 uD3kpLeVvlLt3hG+zVEfjFTnE05K24smWA4JNTz40+tQ/fYBMV+JYFeZ8Op/hFojtXO/xuArCOP
 QRKPYtGr+Dm0PUVnmvw==
X-Proofpoint-GUID: J-2iVQ_27-YNZAjphTDLoYt3UTMyTUrr
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bc553d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=-RDpsTWLj3jBixvrHa4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: J-2iVQ_27-YNZAjphTDLoYt3UTMyTUrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_03,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190160
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98821-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.970];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 20F552D1E45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 02:26:00PM +0100, Konrad Dybcio wrote:
> On 3/12/26 7:16 AM, Alexander Koskovich wrote:
> > This is required for devices (e.g. ASUS ROG Phone 3) where more than
> > one USB port can act as a sink and both share a single USBIN input on
> > the PMIC.
> > 
> > Because the PM8150B uses USBIN to determine VBUS presence, a charger
> > connected to one port causes the PMIC to falsely detect VBUS on the
> > other port, preventing it from entering source mode.
> > 
> > For example, plugging a charger into one port prevents using the other
> > port for a flash drive.
> > 
> > Fix this by adding support for the vbus-gpios connector binding so the
> > driver can use an external GPIO for per-port VBUS presence detection
> > instead of the shared USBIN register.
> > 
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> > Changes in v2:
> > - Dropped RFC prefix
> > - Remove redundant vbus-detect-gpios, instead use existing vbus-gpios from usb-connector (Dmitry)
> > - Updated cover to better describe scenario where this change is relevant
> > - Update comment for EN_TRY_SRC to make more sense
> > - Skip vSafe5V poll too not just vSafe0V
> > - return gpiod_get_value_cansleep (Konrad)
> > - regmap_update_bits -> regmap_set_bits (Konrad)
> > - Get vbus-gpios per connector (Konrad)
> > - Add bracket to if (IS_ERR(pmic_typec_port->vbus_detect_gpio)) (Bryan)
> > - Link to v1: https://lore.kernel.org/r/20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me
> > ---
> >  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 53 +++++++++++++++++++++-
> >  1 file changed, 52 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > index 8051eaa46991..a8f6687a3522 100644
> > --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <linux/delay.h>
> >  #include <linux/err.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/kernel.h>
> >  #include <linux/mod_devicetable.h>
> > @@ -176,6 +177,8 @@ struct pmic_typec_port {
> >  	bool				vbus_enabled;
> >  	struct mutex			vbus_lock;		/* VBUS state serialization */
> >  
> > +	struct gpio_desc		*vbus_detect_gpio;
> 
> I'd like for this to include the word 'secondary', since it's not obvious
> that if an external GPIO is at play, we have two ports connected in this
> uhh non-standard fashion
> 
> perhaps just secondary_vbus_detect_gpio

In theory it can be used even if we have one port.

-- 
With best wishes
Dmitry

