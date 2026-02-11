Return-Path: <linux-arm-msm+bounces-92608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FGdEuqkjGlhrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 16:48:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D641D125D92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 16:48:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65EEC3002761
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 15:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF37315D5B;
	Wed, 11 Feb 2026 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="czgM1u8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WURM3hJs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BF529BDA3
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824898; cv=none; b=HBSYcp8bP+J58KT5xW83Ef58nZS9ZiqpHy1cAeXjsYWpuWgpgi0gVU6km3onm2BU98PeN3s3vgP0jyfI246mp5uGzgJXg65h7DiM0ucATcShCsY0LMCE8Z/QCH5Ewzucm825zf8rOWJzn/M1S9re6vU5qES23K0a/rrEvGy8Tak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824898; c=relaxed/simple;
	bh=VBRIyNi8N+iHonVf3Yf37cRzgOZh5aKiZE9pdBVeAqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuHOCH6LtyzjKzyzugxfIaGumpNItOqJgmRVKi4rKDD2FRs6xVwR4V4t4MKodRgat5Nb/y8B1nKzGIRcBsSETTO29sHGZ+eUWKr6SAwC51IyczTJaWLbUA0gQfjB6AbaXGJ74yYbwnLMXdIDYlyAlRL8pEpAWmLMQdXKU9nPRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=czgM1u8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WURM3hJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BEV61P1507088
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 15:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3h+65nGr1zrxcuS9iSxavdhI
	M1kGZX11XmzGiEmECxw=; b=czgM1u8YsaaAv78xDzDhIMExxRKK2rReLpmCnnsW
	0IZ88tzqPfYeIFIUwqYg014cS8ov7I0FBT3qYbl4QeMLVcLyidkY8Qyb82X4ZjeX
	PJUGUJle0k/TmfJWq9vkv2oWGQm668EzWuz4CTM7K8gsRUJbpNTXLUItLSqQE+u1
	YzPkcCEk8c1Tn8QgUyIQH6ZkOPMU0DkcQ5IP9soWTqilCDBOf66iUs0C39EkvY8I
	YGCUZOZc9UZ+VqkufszRLXEvqMc5z7ZuO/lDfWoTQ5op9NlrGBOdzv3wZ8k8U18x
	uCtsrjFlWb5jZDlOLGvWDTgI/2ajfbEN8C0tb96ai0/dhg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8ukt097f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 15:48:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b315185aso2580050885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 07:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770824896; x=1771429696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3h+65nGr1zrxcuS9iSxavdhIM1kGZX11XmzGiEmECxw=;
        b=WURM3hJsv2tt79miaOgjWS5DxyAy+HTzJIURzRN9B/NAeUd6CiqSR7epx2iRsq8+64
         W7E21KSBq60YDeJQMU1PRyRIOYLOGrdkSTca41qZT9369eVJJ8v5B0oZK4VO9Sz2xT3e
         yG6hFUng17ehVHZg7+Jj8vdCJPUEoPZ11u4dv/FNyD6gbgAgThOLXMVzRnb+jyA+R3/x
         +z9EJR7opy19ZLTJLPdyVhw9zmkHWxMdvZjQTWDgfVfHbHEPQKWWFUgOgjCBQQ4bqAJR
         5JVIo8ev71Q4C++j0vy7emiQMbMEG6Od0b6K8G1xzO0tqC6Csub4SU1JAnc2AHd88AhS
         2ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770824896; x=1771429696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3h+65nGr1zrxcuS9iSxavdhIM1kGZX11XmzGiEmECxw=;
        b=lyZUBD2ZiFqTtciXgAgBvwYQPFBEwYG6hh4gVwPkKLW3OtpI2NsYnzO1OLOZIet3L7
         pGYRjQwq637hwWUEnPyIL7WtfiPOlUwCNciHo84106RcOKnQy3IX0HN5xb8CEt/CHyqB
         xnenMIk4Y2lKZCMj/u54ecTytkNlWSCE1QadIBGk2PiAzleuBDjogczIaVloUao8hp0u
         0TWQDZpUFsM4QJBFzXLKtb8L6W4aWrqi4OEe1weGxL8gO8tortpb6bd0QDb5ywcAZafP
         otGpyONOotN+HhtGlmft8MvmhOy4GReQDV/93QpsmDR8k4tE+dt3rriHpgqpLwQ3VUp6
         kP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlvIfJMJ5xPdIS04hTYdA9pC0eJ3Odmw/UT7/BlTnbB1iZHgP9IOWpir0yErAjI4pXC+XLKdL8KKmUa7Bf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg+1wyXUs4/cj0GzyJ+VycpjEFVCXPLuxK1OKvFa9ULVpIr3NK
	j+vOQZUuY8TC7RFenB1SO7/BlwIhTgPQ51DPSrFKpho/fXD0vJ+4TXw5mJStPRlECEVCFD9E00/
	WSXSp9rMn2Tf4FW/dZhpv8dKTx6T1PtDrQ5x0s6VEYu6ZUcFskB69eFWJmdutQugYZBhE
X-Gm-Gg: AZuq6aKwrMu5/zgy6xekpYfy39VJw4J2DbA/o8qV/8aCunnkUQO1gYmF60FhUjHTEB2
	4MOAlDWq1MGXPTPVvz4TWKjWxOciZQOFNTdgWQDXrzaDzwKzfZIDBojGs3uPxMSgNPUlexnQ5UC
	NVxRFz45x36ncXlpaAgO/n9vezGkNk8hqf3G7KUMQpwvu7+TjIwGdkWCGZm7gmU04w1BQIJSmPT
	f3VZ/MYx/WAmcoBBpnRHq0Z0vV4nHTmke/XgBnzYKBeqe0ayOHoJ0ZLvmLBMZIGwjrL0OwcENKj
	TecV/enMrp1r7RPTfSORyjK+O7UgOdkWC2qSI5srUJrgvSvknjf+1WlEFr9OUQSeUyJZ9+n9Upr
	dSMzYLX8KiZfWBN/LadjdoqI5BCqDTL0GP/6uNbmLLaD5JPdnyCLFuLop/XZZqxA/WUrEqPyy5m
	/Zqw1zQubsZNdNW2+DH3mVl00cUsjQmWpjUEI=
X-Received: by 2002:a05:620a:7014:b0:8bb:26db:e22f with SMTP id af79cd13be357-8cb27fb7c79mr389200285a.30.1770824895803;
        Wed, 11 Feb 2026 07:48:15 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8bb:26db:e22f with SMTP id af79cd13be357-8cb27fb7c79mr389195685a.30.1770824895266;
        Wed, 11 Feb 2026 07:48:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f51edcdsm405137e87.0.2026.02.11.07.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:48:14 -0800 (PST)
Date: Wed, 11 Feb 2026 17:48:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: sm8250: Add quinary MI2S support
Message-ID: <aqjyq5rjovomjod3gmlwh7s3wmlmezom2ucg7j3dlvji35ern4@i55nyr2dxcd7>
References: <20260211-snd-sm8250-quinary-mi2s-v1-1-f62e49d85af8@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-snd-sm8250-quinary-mi2s-v1-1-f62e49d85af8@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEyMiBTYWx0ZWRfX398Q7cGl4KgW
 2o05RTtTP9DW0CfC+ZR1zJ/BHQMsrGBKiNnPzpSMeShDK7PxDH6c1+cKm9Emohbb7e6amq8AJUI
 hs5TGJQXJpRCciDFLU/VZ0j4CEeG+OWPoOb0dbRW4doaVDyQ41E33qF8tOHZtJeBIZ8PbCZT+Hy
 HAIuOiWT5a7UF1F6pLsTXTC7bBVxHAdPOYrUCotiGHo7FB4v/SvpSc7WmnmHYxhPYKkVus475T7
 qsrR4r7Zx74dAqNpfg6Cge7I1UD31cVoXygjPXR8JVQNM3Alw8r5B8iqUwr8PSbqwcrc+sbi6Y3
 PEi5qYq1q39V/WcctJwFzVd63jAVmWhGtof5+6Ki3aV2A+/OBm473tnvHbgqiBjw0yfOMrTN0KM
 MZPLUpT9ladxDHEZFhcxCEtpVrz1jrXhBVISHc61HWRL/v77PeADUJChbEn/1uNpDk1O+1K3kxV
 fT26v9m3VsMg9MNmUug==
X-Proofpoint-ORIG-GUID: T-5ZOO1mPBplF2bObO8mHtTYyYcXyMH4
X-Authority-Analysis: v=2.4 cv=INIPywvG c=1 sm=1 tr=0 ts=698ca4c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=a9vZSWQi3jmT61OOzWYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: T-5ZOO1mPBplF2bObO8mHtTYyYcXyMH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110122
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92608-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,machinesoul.in,lists.sr.ht,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D641D125D92
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 12:30:10PM +0100, Luca Weiss wrote:
> Add support for the QUINARY_MI2S_RX which is used on some devices to
> send audio data to speaker amplifiers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

