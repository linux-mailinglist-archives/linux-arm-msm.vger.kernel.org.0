Return-Path: <linux-arm-msm+bounces-93926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIUeEZZYnWlzOgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:51:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D91834DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DD0A30862E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71ECD365A0D;
	Tue, 24 Feb 2026 07:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/INWWND";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHnwg8Xe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4084C2D7814
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919423; cv=none; b=kZL48hG+HF5FehKWHnB1hQUWvc83G1lwBGU8SX8ZvrR8SdzqKDIXgEVgUAduvVfja+BAxEndkD/9kZGW3aP2J3SE8uIhgl/TQFTuWInt6oZuxBmo9ik0nClDNiXwPeL+elmwNCekmzq7in2sj1mVlsaIgCn8oPt7mDZTGREkf2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919423; c=relaxed/simple;
	bh=L4/CAGod2Paq4GdDad57ZWrHEEh9z6Z6f4vEPOPRFB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKXhWqchBHcYiiTYyI8bbGLJIgu8lZQCqmjvzDDPibLY7Z+5ZolNBsy5TMnzj2YOwyG3s1mPpwueqAwBDMx8bmccJJ4Nt3D41mDQuj2gEpdiegYPQyCu4AV1BKiVap7ykJK68u8LfmVUjnwFqRYLTwdcdjEiKu6A4QS3jl2Af84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/INWWND; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHnwg8Xe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LS7b1018070
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1uOYVneysWyKMZ/gsnkyDckyDOKVjyt86PZxz/YcJHE=; b=L/INWWND3hvj6Ki8
	aCRchWJoPrjyIKSzjPTfRmzehPOqgiLPMtJJxmEF8RMee2lNRoibCnvtv7up1SJp
	VxPs1oZEtf8O6fEyYHoZ/yuwZR9/Ls5JlJZaHUDwA9ryrbjpRJyKxQBgWl5B9i4K
	ZJ/xwXI8S541WlCQxGCzyFlWC397/yucY3JO8svSPxfKaQVVDejFw2bu8MqN04lR
	jQ1q+lkKWN4qx14BBWtDQRBF+Wm2g5XNAGMg52FdtysEYybiBFiY9cQk3pi4ocmz
	pELseHKMBDSYmcPJXE94edyGRlH1snYs7WOeZPuHJ8sDxKzS9L9qzpIeHEgUmIuh
	Ba2FxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj8b47v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:50:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70d16d5a9so4175882385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771919419; x=1772524219; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uOYVneysWyKMZ/gsnkyDckyDOKVjyt86PZxz/YcJHE=;
        b=RHnwg8XeDp0GFXnP1VbwMbf4t06POlA4Gu/sHmCrnFf7NZZ3MeUfLwhR8z13X2e9w2
         4OqlryOIhuBqh0xyPNVqIjwBy8zWioxwrtPNnwmhLXQrD0irHzPWFOshbolEFea//o8b
         fgaUc6BxM86oNBJc5jQeXS6W37JtRXgyjX43NPFQfLDpCdXV8CMJUjdHYN2JgHJER2Uv
         wsrnxMvbtYbGzeL6Oq0fRJWP/taHogkEQz3bHiYx8V9wq/ynpBk9kPP+/tZOz20IX2rL
         lsDP2FZvgBIMEVxiqpRbWnrGszRC0jV5+f5jagNUMHq9g6e3TrWF+sRBL/NbbT4wKz61
         V/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771919419; x=1772524219;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1uOYVneysWyKMZ/gsnkyDckyDOKVjyt86PZxz/YcJHE=;
        b=fOvOVsWgPP3nKO8pU+0Jki3pZMN6F4C5n3GQBGMbupG4Wr26qz/FrsJBHJ8ybk8qVr
         SMdY9S8OQdHm0dUkDy2IJSMKIEbDOCtvXyRZxQ2vSzpds+eB/bsLn4yUQMmsRlQHKBs0
         wYyXsDs2aetSaBGCZwfI+0rlWTAj04lOdrJ+Y2Zzf3YjevWgu4Q1h98BgeuG6l60tDZJ
         9w3dWJgR/Kj5+y3+8Ji8dWBmSWKd+hLQRwv+/HuQHA2sMGDNJ7uUwSWAPxIjiIxKP6Zs
         IX0dEMRZ0bb73Mo4f9/PYvaZisC0pWG5+xl7aq6nidsNOnJkWVTTCdzjCaWQDIN7A5zR
         RMFw==
X-Forwarded-Encrypted: i=1; AJvYcCX972o16MDNO0nHXF3PrenisFXBzObxvWSruKBW9nxKhtxrRMtItg904bIYMuYn4x4O5wRA33QCOjBfu5he@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ri3D/3C8sj1X9pDSKleJlKUcEH1snEwRF5yIuMXyDEmP392J
	lKSk/kfxIbvJGm1+5411sw6JuP3RpVROsDOUyaG9Il+/ZV4m6gvho10NojiOO6hIgzjU7euJlov
	cySu6oAl3hn6WiwkBsdLW4ixx9b0wQth5GiQrrSMFwhvRHrqViF9muy9tO/v/ENdGpNcx
X-Gm-Gg: AZuq6aLdb+PS0mE+TRwbfq0QIuwWzFhtamrK7Q5xwE6oNTFO9ewyWNtlumm1c/r3tG0
	QFBDKCei5i2A2MKht+tc9cvIFe1eFt/zYJ9FX6yNKtAoqOs0IbAQl+PciHvkNBCfxUYgPzt4vP4
	kT+02lWkC2Nrf7ZI9i1x45P1E6TVRJD0+ZOddRJ87VbF1Owt+6NoOlCcO/Z8IP5RAnkOMjoYmGH
	CcimVEVQL4+/0N08r7r8b9w2+tv5qsTdhuWMIzv5tAJ67VhnG92qw0FkElyxtdSbwNDLEAzBJIr
	7zJLCxVW/YmyuqWxdSCB7I0mFk2fxokhUPGFoOf3q3SZH6jYRFFxMS6t/SB3ZxnGVOZ1hVq2MZc
	AAfWQpWjgY5HE/j6NRfJ2bX9+ZmBXOXyFeseV2IVLFYpTmk9Uhup1A8etmG6I7BjKsqDpT9kOw7
	w6jQm1ji0FtMhbx6j40M1+fNLjjCsDMukCG2Q=
X-Received: by 2002:a05:620a:19a4:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8cb8ca8dc05mr1376656285a.68.1771919419518;
        Mon, 23 Feb 2026 23:50:19 -0800 (PST)
X-Received: by 2002:a05:620a:19a4:b0:8a3:cd9e:e404 with SMTP id af79cd13be357-8cb8ca8dc05mr1376653885a.68.1771919418924;
        Mon, 23 Feb 2026 23:50:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45938sm2000589e87.69.2026.02.23.23.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:50:18 -0800 (PST)
Date: Tue, 24 Feb 2026 09:50:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] usb: typec: hd3ss3220: Add wakeup support from
 system suspend
Message-ID: <xxu3265rn5ctt4n7jtegizwdoo6r2w4aia366ftzcubhsscdxl@3minhgdtcmtl>
References: <20260215183325.3836178-1-swati.agarwal@oss.qualcomm.com>
 <20260215183325.3836178-2-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215183325.3836178-2-swati.agarwal@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2NyBTYWx0ZWRfX2/jTEBH6f+TV
 tJvN1qNXPiHJXvcPwpKHGVG7PqmYx46a6ug1yp8keZEhKwPQfgKOHOL6gkbnRajn+/d0d574027
 JfbcxykVxenFYkJVbWD5xe9XayV/nvPq4CezPNXJUnoLmuQTUx+yGkTLreGc3mEMk3jF4eDPdU5
 8SsKJT3wHj/83abbG3PJkgjVrCZ3wmO6dh0u2urfADFn+kvKjiXEsGUJ0KHlXnKuYcP0faihxvS
 cDxpcL6gqFmk+m6Qok+ZpbdGToZvADS2EobjKfxmLxCeaviYXB2mMdhLn35PeCE1XK5sBjYocEW
 TLjTSX6XemTWej64US6GqfIPRjSSix5oS76JMLNtq3v6R+TvoHgP08HlUVs2+d7Ac85GwSe4Mnl
 Lmp4mOHRAt66qYLNfFP+baxmmggwLH/7rjQ7TJ6kuilKf24N/QUqforxtGHYtIx8oPwQ1rogh7Q
 YKDskmcGL7E6MJWYxeA==
X-Proofpoint-GUID: cqwu47OJMb7XnuK_PJDg7aNZc12MasIR
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699d583c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=YYzu-XlWP_f3crXEb8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: cqwu47OJMb7XnuK_PJDg7aNZc12MasIR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93926-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B37D91834DF
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 12:03:24AM +0530, Swati Agarwal wrote:
> The HD3SS3220's interrupt is disabled during system suspend, so a USB‑C
> cable connect/attach event cannot wake the system. This prevents resume
> from low‑power modes when the port controller is expected to act as a
> wakeup source.
> 
> Add wakeup support by:
> 
> - Initialize the device as wakeup‑capable.
> - Enable the HD3SS3220 IRQ as a wakeup interrupt.
> - Add suspend/resume callbacks to enable or disable the IRQ for wakeup
> depending on the device's wakeup configuration.
> 
> With this, USB‑C cable insertion correctly wakes the system from suspend.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  drivers/usb/typec/hd3ss3220.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 3e39b800e6b5..b56df9349f89 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -501,6 +501,11 @@ static int hd3ss3220_probe(struct i2c_client *client)
>  	if (hd3ss3220->poll)
>  		schedule_delayed_work(&hd3ss3220->output_poll_work, HZ);
>  
> +	if (client->irq && device_property_read_bool(hd3ss3220->dev, "wakeup-source")) {
> +		device_init_wakeup(&client->dev, true);
> +		enable_irq_wake(client->irq);

I think this call must be dropped.

> +	}
> +
>  	dev_info(&client->dev, "probed revision=0x%x\n", ret);
>  
>  	return 0;
> @@ -525,6 +530,35 @@ static void hd3ss3220_remove(struct i2c_client *client)
>  	usb_role_switch_put(hd3ss3220->role_sw);
>  }
>  
> +static int __maybe_unused hd3ss3220_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	if (device_may_wakeup(dev))
> +		enable_irq_wake(client->irq);
> +	else
> +		disable_irq(client->irq);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused hd3ss3220_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	if (device_may_wakeup(dev))
> +		disable_irq_wake(client->irq);
> +	else
> +		enable_irq(client->irq);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops hd3ss3220_pm_ops = {
> +	.suspend = hd3ss3220_suspend,
> +	.resume = hd3ss3220_resume,
> +};
> +
>  static const struct of_device_id dev_ids[] = {
>  	{ .compatible = "ti,hd3ss3220"},
>  	{}
> @@ -535,6 +569,7 @@ static struct i2c_driver hd3ss3220_driver = {
>  	.driver = {
>  		.name = "hd3ss3220",
>  		.of_match_table = dev_ids,
> +		.pm	= &hd3ss3220_pm_ops,
>  	},
>  	.probe = hd3ss3220_probe,
>  	.remove = hd3ss3220_remove,
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

