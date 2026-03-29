Return-Path: <linux-arm-msm+bounces-100592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFOBFS33yGmFswUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:55:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CB83517B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 11:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2916300381A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 09:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F023033DF;
	Sun, 29 Mar 2026 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBtlLV3b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kt+6iUkW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD8B2F3C34
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774778141; cv=none; b=YQJJl6i192PQD1DnrTmqhbyqJhxHHfHhQt1uVWjDZE7q9xhSX5DS6wO6mYlCBd+3FIzdPw1H8gBdp9BAzKVB/84bSwcUHgo7H8xBN5KGXHBefw+4/VI55kZlmzRXPIm6XUrt5RUqfFyNRnO/HdJDxh4xdVKFv9903xpzXLdBXPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774778141; c=relaxed/simple;
	bh=MgyrX3X32LwQJpr1AVmRVaUIPbB1ZZzIme71b9y/2rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4DftmN0SVqZIMte73tCjTDv6yTpsuLeTR9azFsAQQuusqi9BmH09vn31LdBfV9quKi5Ahv9zm+jRwWxASy1KvkO1lsky5PXxos7JVpoGRxl6YVSvwJFgvQvX/mrc6OWHQnlcpeF+vpM3uJqFHQelF+TRUR9VyRL6JzMGEbEk6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBtlLV3b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kt+6iUkW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T9tIAu2856547
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rw8dxq+hZXQzCK1jWiqk6nPZRgTVRnpbxtwfDSkeXJg=; b=aBtlLV3bZIhfI9mp
	2bekLikie1sgR/wzSUyAmn5wojh5XF1HuGzYgeKFVoz2Z9O06aE5nznxeEGlmSTS
	nynCImLVO9D4r78rDT2vtx/pWXFhExfoA+M9cvRYTZHepq6zyBI7QOLoHZgZulq6
	RmGnneYLEQeJzn5sbHnPfc6Cq5Vs4Nid6o+VGHfELavMwj01Bt3DR5ioKXmxut9s
	UpPLWeOfJ/A4xEwjr8Bp1qucEiELYsxfRU8gFGTMFUP01BNRutj00H5OIY9+HKkQ
	BtXNJ4LNTCVXdWCiaeBy3m3/ym7SFw3YYS6jd5wEZLk9cb9ZItcvxMHoAq6jJKFf
	SVwfEA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6wqegc2e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 09:55:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b44f7b7bbso109591081cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774778139; x=1775382939; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rw8dxq+hZXQzCK1jWiqk6nPZRgTVRnpbxtwfDSkeXJg=;
        b=kt+6iUkWiyTTZqY1llx4TxqEs1qNLrs0xJi7Uoo8qtyulN5mrm2h66DZ4YQXoKDH9f
         n9U449q/VnlP8a0Vq4MyfNSu/dUdQHxcD105+QVW0psGH1FtrAartlkv7Ih9aZZeL4Qv
         hulVH28CEimg5XdTa87HaM3bUjX9TCJJ4TFFI6NwW5Em+bozUakAt1fIg+n7in7fVDjj
         fc6yMenGvBmBE/0R1ryfhSSXllCGPeCt5TMvrB2ZTziiXTuY0iympNB3n/WGxHrzGAVJ
         TqOi2KWmR78IxMF9w+YSlkZOCC1i3F8bwGDHwNNoYcvzQk+42Q044OkzNR6Q7q4Jo3I0
         uNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774778139; x=1775382939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rw8dxq+hZXQzCK1jWiqk6nPZRgTVRnpbxtwfDSkeXJg=;
        b=BrVGaEDazBpqu1iDXePvzqyS/ouwBJ9cZe/04jW17i3xAKzIO+DS4oWWO9Fo9hrCb8
         A40/j3BRU3jn23anq6NIK4Suom75rmZiuFYmnhFPIqjarFBtG9LcM/mJJoC5QKtUg10Q
         YvfcYYec9GE57R34h0BzEMfgbeND2fiiZoA35c92IR9KBvsRE7p6PqqAzioOo57V26ey
         AMW3II71fGnxFYUKHnvwYpmOAgv60SiT9QSJZN4DhBydo17SDkpN4RmtdFDNwuEUKaC6
         AuoPIFt8sUVZc0SCTcysQeI2eUgjR0fyhWmPoIY++X1T7t6zkC7U7zcnuLYe91JHOL8g
         s8JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsfPvezAUaN9HbsX0LxfL/0Tvn7E9c6HrCSCw4nalXceaGuvVcFmPmRuyIClDL2Tu4Zjvds5eQ6WSDOF93@vger.kernel.org
X-Gm-Message-State: AOJu0YxA35AshQPlrV4XEyMwGv3a8BgpkWse0Et7DAPLgDlGLNaofCKB
	OvCYrIgUwnXtuHbWK+JtzWnPlvVCXe9nOsJ3MRyqpGb1oeawBbE/cH92yUuyQ+cEzojLm+iOVvk
	UNsajQcxYFr4aJPl3jHTQbuCJLHuzAuWFrQll4u7LYpeXUvnnpC63d06vxUgae6dEMeBD
X-Gm-Gg: ATEYQzzc7dimhcjEhGpd7YK+Nh16ZS6lGYcsi1uMxmPgbfbMmrR2P0UOUimGLMTDghb
	CCU04obWTAT++HZyGCr4dJHt66bBeTEOhw8kb4fE72wWMd+sbK64SmemmTZEW4HOUUb9sharC5G
	fLHMzgsta4CrgBBPgHylhhAwmG5RhEBYcWD7/jQXN4Iplixnd0HRqhkwPvtB5TQwB3fL0GK9OeU
	Efy21LAn/tcL/uSh3OaiXlhUXW+tIrpHDcuq8Wh9yoWS8aCdorrXKyx+6eePYsBBA4D7PXtWvPs
	F39WcjCuT8LgVvAIFzD4ncglkU+JibA+t9SYVY78Am6i6H6a4c1ZaMsLmbJxyTHVCRWBwT2IAUK
	bIttDH/swcd+SfoxmNs7JiVLYCYoidyol65J+v/cnFVyK0lh7CMASfyDzxb75i1kvtJho190VQt
	7fHz8v1Ai2d90eqPFXJtwktrxaxyMr8Rdto8Q=
X-Received: by 2002:a05:622a:43:b0:50b:487c:f3d1 with SMTP id d75a77b69052e-50ba37d3ca3mr123446271cf.3.1774778138752;
        Sun, 29 Mar 2026 02:55:38 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:50b:487c:f3d1 with SMTP id d75a77b69052e-50ba37d3ca3mr123446101cf.3.1774778138335;
        Sun, 29 Mar 2026 02:55:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145de35sm950486e87.74.2026.03.29.02.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:55:36 -0700 (PDT)
Date: Sun, 29 Mar 2026 12:55:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: pabloyoyoista@postmarketos.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm670: add debug uart soc node
Message-ID: <2rexatr4fb4swy2lgxrvysixjekcsbj4fn5mhy4dcwqzjfzdxj@apwgj33u3boa>
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
 <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-2-53abd9db8f0a@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-2-53abd9db8f0a@postmarketos.org>
X-Authority-Analysis: v=2.4 cv=Jo78bc4C c=1 sm=1 tr=0 ts=69c8f71b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Gbw9aFdXAAAA:8
 a=EUspDBNiAAAA:8 a=Qxqo6Yx1iAqdIdhPiXMA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: WkiaktYIaGq90ZcM6ow0nS2aaFy9lQhh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NiBTYWx0ZWRfXzWibayk1KhuM
 S5gboJq7mx6WuubHFa8/QWydv7VfPHPpI5V+uh0RbfEpDOXZ6fBDQRTpOJsCpz0lPk0yb8KpVa9
 SxweoyXVVGo5VZrRP6bjNS9XqJRQhqPnM7zjDZ8M9LB3sRZzz9fDUKHQKbwBKNrpyTzLDrGlo+Q
 w3IUxJEuxYKsxrA+afq0VTMH5+KvMi4GbLlaT1NaLo+40vW0eD5NVgGro1yDAFtlJJvPec9Grvf
 zP+r234BdfyMKrXefY9P5/C2a8pqG0gspEwREmxXN0hgOdrdhajFmSjzir1oJtXfmsMAOoCeSbY
 N++pRl1RUl2SC443c7QCAWQodf5GTvbDO7r/wyxSlD1204I747kDGJc0VU8cX+8qXPp6wRGad5y
 ylNuV3go/zA5d7E7IPecrSRYHv0OvyiHkmEemyjL+GaB5YU/vBgW0oZJxrWGP2SjT6lryvYjaF1
 R8fsmNiD84mz0uhSxbA==
X-Proofpoint-ORIG-GUID: WkiaktYIaGq90ZcM6ow0nS2aaFy9lQhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290076
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
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,lists.sr.ht];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100592-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E9CB83517B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 11:58:41PM +0100, Pablo Correa Gómez via B4 Relay wrote:
> From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> Values are taken from the other geni nodes
> 
> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

