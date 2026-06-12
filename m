Return-Path: <linux-arm-msm+bounces-112830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6DEHFbNSK2oz6wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:28:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6137675EE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 02:28:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Of6Pc/GZ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MJTkdwyC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112830-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112830-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0382D3201E9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 00:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF4F1C84BB;
	Fri, 12 Jun 2026 00:28:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EAF11CA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:28:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781224087; cv=none; b=lumD9pGfZnDRGx9Xfe7Pc4sFoO6lJrj+dZi82v0ITBb5yfW7J0tCLwqpd7yEDNeDJvHrr9TiPt7yKsjgxgR0OBHlORKUrzqRUaRF2ecd+7FGGynAMPJr18FzhS0QBgEKTr33JwJFT5JXanTWXP8rRS9XousvDKitZ4qW7ROs1RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781224087; c=relaxed/simple;
	bh=E1ZBaDImfT5p14y+ousIOrBndGpsxu+XYR0GSvcmriU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcIGKzdHyQAr+KXW6ZpYmRWgup/Jo1wJOpsQQCzbkLmWtCDmtTfm5M/36MtlnQZxspxuuh1M4MugQo98o9ewRcTbpE7FxIyGuuFBqcI8sffuv3/vRcPippg8iDIJjwJENKeyMz41uFaXio7jIbw8XqE/Q5ZNcE2KnKIwCpRkGbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of6Pc/GZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJTkdwyC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMW4oB1921997
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6l0mQNRXPjow+FlkvrpYn9i3
	O03bnURn14zmv8KuYjo=; b=Of6Pc/GZtoV88SHtzU30JsOQA+uaAbNxpeSqfY4n
	O4NXIMAHOVM1DsUhU8o10S3id6/azs6vJ6ua7IPkw5iKClhkixSpxAgVkW+bIhJF
	/AH6t57RtvNJIsn9JEWVNezRwKdHQrI02EbUhEQmLJER72IYURB72Pe347P1Szkp
	b87sb1WbJo5iiB93IQdygYmQJgzKp0eaIHl7XuKYKfwRQE5itUwCCtyU9hZv+mdQ
	Bx6rm8VYNt0mm3AF7uHdjbhsGPEwZE81d24Pp6gSBvf/Lb9v5NhtBIfUTsBjWt8O
	W0t5GxW686fGuw06JV/SudeKfhEypXmwq1Ql14VYDe5YJQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbhhnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:28:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517615db531so8575041cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 17:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781224083; x=1781828883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6l0mQNRXPjow+FlkvrpYn9i3O03bnURn14zmv8KuYjo=;
        b=MJTkdwyCCNVFZxYsjwCZDM+cNcov2GIXzGssOPhM17NXQumPFVG7dgvb2mUGRe15Bz
         jd9Vfe+j6xTzitnvqDTYh1n+5HWlWIeRokhNiwMnJ2hhupbN6m643V1Byb+89XAHc+2p
         fa5dti7gyxyZGA+W5O2oXpZYz+wpW67oWhZrNUr1gD3dpP5jAubAWZ1RkYBUtjTZgLFk
         JqjLX2dkTITqQK9B/TLqhS+TnqmbatN8HH9ZE1SvOOOs6VXzYrrlNDcbn9+8g3Pu7CTT
         xv2sBJS6LUeB3CqOTXbkJLuP1Ilu9urUEDfIf8BcAL8isIvNvWj9qsgqQCImspodtJYF
         8HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781224083; x=1781828883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6l0mQNRXPjow+FlkvrpYn9i3O03bnURn14zmv8KuYjo=;
        b=gZxlqs7pOa+h+gE+wBMAplxqnG6hNdxj7xzB0ZnfHLo/xbKa2n1jv44Yv7PeuzEynu
         na4Jzjvp7nbWa14DOujCrZlRkoy7TGeWnBId8V5EqfVk+6/GldPGAW2Pp0fJWnXZvdKi
         1gkli3qaunO2CZodtIeIOsjFEPF3yP/mIhR+0qz10i3YSezDSyKZLvyFj8bIZ8xMmMS2
         DAUcRv/7j8fR0gZoJtHamyWAH4zMMcUMXmVIslavo/buongX5u+vX34+cKUQE88Er79Z
         Rb/51Vq51CGlns/CxY8N2nB8QMl66P39zOZs7oFN7mb+GxpZ6VeRbNQ+04WvEza2jWQR
         Qk+A==
X-Forwarded-Encrypted: i=1; AFNElJ9t4l/b2Gh+eGEB56khUw1cnk28e76lfivoUnBiJHwFbata4TNFMOfaFRn1OxnrqDBBZeaLAPjJlPJZJYVW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+DFpsEa01XGoClabu0QReabFtoSSZkfJs75iTydft6SPvLSq
	3HyhGTGu63JIWVYba6VZYgFXXYAy12nYeZZ7qdfZ4SjmM7KkP1MTaiAxaQqQXZ+wn1SOlUONGkz
	qytXhyELpBo5+tME8KMXc/Y1micEfr9Y4jZY8InvIwWX8lyAdT4jNbNtC0x7/CvoGwTTp
X-Gm-Gg: Acq92OEzXV9zq1T4jjPsk4M5Q5B2CPD6EiCERUPCXGpK0mpBGaCrCMwv0sLY5qyQEtX
	6Qmg9OxaKtmdQU8oCXsS0Y+oy3n/JnzADPdxbLSq8rE65nB6sJryWrUbHHi7Pn5P07fOCo0meG1
	UWZWjZFoihiWFlN4+tx0CdwjCKqHHPnVxTJi+zCgQbscHNVsijBKW23PQ7SO3aaHGPuCklSmpnZ
	6hO4QqEEhWPnMGjAlb+IHCaGPXriZ0kRdrlGAwerypsFhaN0vBWoT/xR+LSZZMzekSbrWTfOBM2
	3rq/1zmE8kwxfXQJNwBsQ3j+UQiqGaMFzqerSBPE3MwdUccT/5Hm06Z79Nz1CVOrqxkMMJIiPr2
	GptiMR6l8HACKrrXPPcb3sVtf/UPxRlkAFAj1Bu092dRrVO8wWbQ3AdbHCeujnyuk/SIimTz2Ut
	Hoa2dJ8/gMe4neRHOG1kPLg0G+GLDgfv/E5YE=
X-Received: by 2002:a05:622a:114f:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-517fe4cac8bmr8368891cf.10.1781224082804;
        Thu, 11 Jun 2026 17:28:02 -0700 (PDT)
X-Received: by 2002:a05:622a:114f:b0:50d:9aff:8b43 with SMTP id d75a77b69052e-517fe4cac8bmr8368501cf.10.1781224082373;
        Thu, 11 Jun 2026 17:28:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7328sm50908e87.45.2026.06.11.17.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 17:28:01 -0700 (PDT)
Date: Fri, 12 Jun 2026 03:27:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH next] drm/msm/adreno: fix use after free on error path in
 a6xx_gpu_init()
Message-ID: <naq44ergspdygj47u3evs5vcgovqokpbenblokuskea3mwnqkh@qirq4jd2f5qh>
References: <aiqNktNfXiaPhje3@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiqNktNfXiaPhje3@stanley.mountain>
X-Proofpoint-GUID: I6vY1V7gZOlBvkY_Nyj3ajdhGLYpetAE
X-Proofpoint-ORIG-GUID: I6vY1V7gZOlBvkY_Nyj3ajdhGLYpetAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAwMiBTYWx0ZWRfX7Or7D/B1iT0X
 yVeEBtEAE/FBRB3s9zYfFdXG6/0F+a2Y/EFtL2iHwl2hSwBXkusPtKjDRdTj1XHgBvF2254C0gT
 Oj2vddyiJ0EWncPbI+kH6aWwamnDkDg=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2b5293 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Lf4_qmz2JCIWfjkWoTMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAwMiBTYWx0ZWRfX1nqxEHk67NQ/
 Cd4INY1EaP1mkcKTvFKaYkDDuUppd5WDXltBHGppKneSrDtHFxz0kuMf7YGyRYrPI/GWy66YkNM
 xFG+tbzVmtDGwCatiy3WCYxTNiiWH/2uefPDmXDAv2W6MLHsDydh1Ie+qlfQKHQfTPT14Ld7Xas
 gaxC7Ib38QdFTOHDFcLTJWAK8hUDIurvXKT03NlhIrouhCri7e1rEg1gog0K13kL3UG40UE3rm8
 1eD8hzQ6BCoLpC0DEjgJ3jpT/mTi98x8NyziWEN5j/iN9WTjPRMDbNf0IbJQbE0DN20z4q5J5NS
 Ce3LUIxwPabmlYQ/M4LHTieXbBLTvhlelFNLqeFlGml7/J+VAsCKWuvCbTTMG+f8PEyGw709w+c
 mnWtT3Ytfy/qDpaB+dcig68GJm2NGyJd+dR2MTwEayU/hMBeO09z6pdXqpt9F8dpJpNI0TeolWY
 c2gPksRVXOZlc3FPYnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120002
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112830-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:harshit.m.mogalapalli@oracle.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,oracle.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qirq4jd2f5qh:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6137675EE9

On Thu, Jun 11, 2026 at 01:27:30PM +0300, Dan Carpenter wrote:
> The a6xx_destroy() function frees "a6xx_gpu" and so "adreno_gpu" points
> to freed memory.  Preserve the error code before freeing the memory to
> avoid a use after free.
> 
> Fixes: d158886cba08 ("drm/msm/adreno: Trust the SSoT UBWC config")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

