Return-Path: <linux-arm-msm+bounces-93879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAiZEg4knWkkNAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:07:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5E5181925
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 05:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F2733160EFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 04:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFC81F30A9;
	Tue, 24 Feb 2026 04:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdwG3hYc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsA6VG1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF838EAC7
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771905946; cv=none; b=le53zHidTKlSi64GV9TLdJc2xDW9zVlOthwTmsw/L96cnNhJuN9JvL0e1UdawQ1gR3w5xDFqv+4AhLb+pobuoYBpD3yUbSd4yze+s03FtyVDHv73KwEa2jAlwI0NZ0YywO/MC7t+SdAa8qgv5lEJWcTQP/R5HMOIJnccl0RUrlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771905946; c=relaxed/simple;
	bh=QGWGA4YJ1gGDiR1E8JZqzwRADKxsbRAcSo3qf4GEQZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WcCrURHPdTFIWtnXjmy3oppicjb91qhu0eOl/iTc7h7HL+EZu/QdzvYoTIh7K/kmarjnxSqAAlXkuzF+r/T9tScQdVfi9NytLLz+gaKdDE4ZHS6FQLfTv57uEOdSgt6lGTcOWOMnrfhuy/wNlEyTvfuR0nsIIeXmaEHw44+5mWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdwG3hYc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IsA6VG1b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O3KqSN2189172
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMipfL5l8lkGuOJbyYr9egIFPHc4nyVIjN+uSQ6jhjo=; b=pdwG3hYcHcMxuaSU
	J5t7Yu06KtVzejenTVsRFAjiyyxcuwV7DhTVHSGQ/2LutpuOZ3T+eqjGzLuW3Pge
	JFIWZ+JIArcDUrC/X/Z0tUSUYFyAw5ljFdbP3ox6QkOlxnjHfgmKhyjfhuQKWAt5
	YCQR0lzKrLXOHxF0/tI+CPfcsD1k8o/yV2+sPhHXptgQ+1XbTi7DYwKUwv+pR9Kc
	pSBVksdUB+SrxyCMAQ1dVkavDVvF+VkE8xxB4xqfpPzPCOX+M9nb0uu5zNORbHFb
	68aSylzm4SrSxxQGgsAUI9fzewNJQdE/mrQMQcvPkdFrvcPuFPcWdpVD9juthPmD
	Ej5D1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj9n22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 04:05:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so7264047585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771905944; x=1772510744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMipfL5l8lkGuOJbyYr9egIFPHc4nyVIjN+uSQ6jhjo=;
        b=IsA6VG1bKBWHbXseNHECWDhTJUGegozqgXq6pfB+qTrY51Gy/08yPhGMlhHHYBiiAZ
         HLxGd4t2ANtfFO9tJ4VLQtSX/P7tDZ7lrovWMB0p+Mnx1QSN2/uTeDtbSKRJEbNf+oYW
         0AenzOqMG4m2sC7S8sEioTKLtK824Jyn7EGuUkqTyy2CEAHJs/pxp8Jk7eQUgw0ujPgv
         vSsPsEGAYpCtoSFt8HI2pgckNHx/LmymenYBJAoMjOTFuunkl8EYlguiZ0x+wGKHG7iw
         hpot3SKKhtNIR9pBMkiztsJNTVRcfUf1Opx0HnXD1y3NkzC0zsp2lsRjLRm39GM7e1KW
         0tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771905944; x=1772510744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tMipfL5l8lkGuOJbyYr9egIFPHc4nyVIjN+uSQ6jhjo=;
        b=hfu5DK/eknNlwCBecYsgyqC9j82NnpvpuMx7FuwvtC21SbQVrq9AdK8nfTSZUDdocY
         jRTQAohmzsg8ngtNhsJym7DF+k8R9lRHpLH8alBS6ep8/5p5PNdzwzp6kKJ88OsU/ADl
         xSBZIw1mLpQG69VAd02HnlEoQmHEwdZc+Rf7t/SkidickoOkul8MEDAL0PMLr52yPjT6
         vzyfCrx8I5r26tlAIqIIHvYOIfOzVWfWE9Y05LabYkZlIzZtHRQ0Lbw75SR0kh/p22yj
         LY+vRk7aP1zx5FRKIDgZk0rFCGdxyUwlH/M79QZc+MeR2TqiaACRIKLeLZLASyXRGGRF
         RPWw==
X-Gm-Message-State: AOJu0YxTR7cO/rT8ZuK3XFsuJVxsnu0pw/8/w2H78fmr+h+xNlDB1+Ys
	aIze3Rrfm3Zq6Sq6T79/Y+3Gt9gkPBMhxpXtH/EhdgW288z//EwjfcprKiGzvUhZ48UGqyB5fM+
	8JYu+e5P3VsuwUBlsGM00/e6VKDA3F8G+0BVZ4+0nCnB8LGA3DI3PARNi+XrvnV4HSFZ1
X-Gm-Gg: AZuq6aIWrDjb7O91wgXlfcsDi/R3KusJGNAGoQiNZ3YOsq5qYO6Ubfg61CGUcVdsG3k
	GkqRGjhXowNxksx3/eJJKrdH5muTA67Q4wz8V//EhDMebL6H+c+UQSBqsSYY2OHpAWjKoSUh1gN
	AgK19Yd/Hg4iotz5VDz2TGm4wJ/4AuN+8alySdPaoTy2Z9JaGdNJ6bXJ6O9VUKcbrBJp32DPsmK
	EwcJsJmbxfu1DIVm7guJMZk//VonrkrJ1s+X5O+5Ca9jaTLmhK8arTHYNzJKGD3gSrdoasvxyTq
	GEgVOSo0B+0EETZb1QFppXxEjgZpF9d54EcQINLIZutsxWz7rY70T5xaFdw23DiVe1GsrCYeKjg
	xwA/bmZXdvOmr4Y8UX/VpsYEmDP8S5jBIa5RkqDX3LDKJ02fljOYAjwnm6qoir708nRBJiWswYc
	eHMfrDQU7xT4u56q+4DMneUPg7KzaGGip/dJ8=
X-Received: by 2002:a05:620a:bc2:b0:8ca:4288:b168 with SMTP id af79cd13be357-8cb8ca6e616mr1468294485a.42.1771905943996;
        Mon, 23 Feb 2026 20:05:43 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8ca:4288:b168 with SMTP id af79cd13be357-8cb8ca6e616mr1468290085a.42.1771905943358;
        Mon, 23 Feb 2026 20:05:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:05:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Don't use %pK through printk (again)
Date: Tue, 24 Feb 2026 06:05:28 +0200
Message-ID: <177190591478.429979.1949175178030065433.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
References: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699d2399 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8
 a=_ym-YgABFaPYJePyZlUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 4Rn74mD0mr1upOquAUEfwHV3TvuhE_1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX8itVFtpblOVk
 Fw7LAyCtmkXHSBIxGUhXmqrbTxj6RbgbN8fOy8/M0BKAXDqJxyTgkvnEcvDdVauWBroy2QZ454I
 pmjKpgW+YvVXtJca9hcfWQDhp0kG8WJ5g9VrdQZyAblsmhmH2C0nKzsTXdkLuUGtBKuLpLD2pXc
 zySMq5qf0okHShclJbwHuwVTPOA2BGurw+lGaOagXCj8GarPNNphCmNQ7r8I5b6MronOyw2fx9g
 LYlzzrhJ8egYhVRQ5pRsSACbJIBcc1tJhVRL/BosLuMrjHkO/V824Dsit8tlyKXwyTlZhuyGgCd
 S1yAaic1tKaxjXEUwADCU+C/MONxsU8AkcMIL1hW0sfuTpOtBCPZPBDJ68kofWKQN/Ib2puOKXo
 o40omnZUR9NqlNbbewWwm8nL/M7VhgTZY+koWSfgV+u7sHH4KoaF0NsEA1S/tWqt3rji5vpcbRg
 ZCkq7MVlKDqEWwSuMVQ==
X-Proofpoint-GUID: 4Rn74mD0mr1upOquAUEfwHV3TvuhE_1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240031
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93879-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E5E5181925
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 08:16:55 +0100, Thomas Weißschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Don't use %pK through printk (again)
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5886cc8f895b

Best regards,
-- 
With best wishes
Dmitry



