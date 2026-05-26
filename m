Return-Path: <linux-arm-msm+bounces-109820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M89E9OcFWr9WgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:14:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9F55D631C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19A973021383
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066BA3FBED1;
	Tue, 26 May 2026 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EL3VlKhP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UQS/yMJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B6E3FAE1A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801093; cv=none; b=M4L3rjp9trUQblTJ/xlYPqlCZMcxvwCstgz9+izAtLuTZtSppUb0qR3NzZSS4sGamxCzbJ5pU4lizDmMLSOknKk859KWCRS6dW8Kef+X/vf33tcSv43FU6St7c37CZppLgper4ab+RirOHBB9g1eiKEIj3xzGBPnB4HoCm70igk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801093; c=relaxed/simple;
	bh=W1SOKd2RIQ9nozxC+fLn2sIL5/s1so7KiyQzTPwT+38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adN+U3YRkjbwHFkznUjRI5ZBcx98LcEohvZq4ybNuR3FcEBEHfDZdz1cS4AD0iI8DZIYGCIAIEGneuGbMClRB/KpoTzqZnE04IQclJisvCg8O2n/FLZXu2TR3gd8GRofcMWR4mVNUncOsRX7QN4CAJiXkCkqlZqnhM88cmEMmuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EL3VlKhP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQS/yMJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsXlZ1430475
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=; b=EL3VlKhPKpTo8VtD
	DLli+tRTMhesH4IaeOloJm2olJfrT+88J4LsNG0YQgypjCEvqbRrc0MUsrUrvVTM
	LtYFwCY5AlRgSyriX7j2kWsROltLk2sP/Xq1zYwduote8gNdS/EsAe10ksAlNcN5
	KBj8qqx+CtWAEnp2mp225Q/FqX8ybuv6D4m+vqljxdvwJQb2+14bSvg+zScYSSqH
	4ezzgQpbBcCVt2q4dlW6DFNHez3WMXtn8VVTzxZZvitom8KobB/aDWZxA8DrvyqK
	9eUJAIbm00iontObpVKfkfCoLWjhwzhBWOYWFjEyrLNS942DMy7SJnJa4D4b6jno
	6S8Qug==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv52ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:30 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-636fce7dc8dso5503620137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801089; x=1780405889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=;
        b=UQS/yMJVR39QJ5wx69UTjVCJCU6jeGlnf0bAngvIk/3TlmG4L1pCqmtmEyaVLCpfNi
         7387NCuDIRT5p5eQJ5IAFSPsEDrfCLcQJF8EYM9mq1K91d0jEMKG/cJc4ut0hZj7PVzO
         daz0kpk4Dc8NjWbUT52/zg4+t5R/Dl7pk5AtdTQn+NL1NY6RyIgy+D8YIKlNiwVAFYTO
         xxeGDuTAn36Gp/D+tYkOKWtSJh/24yfibQ/H4LMO77C0TFmIdl28bHAvTjoydsNH4NmE
         5+RfkJII7TKPRlU/7A/Y/BYiEvJ8Eagdh9OuYR91ObIG++XdlIJiLR1eS0RAERF9H+dn
         Vz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801089; x=1780405889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=;
        b=VH3yG9zTAc5/z2a/Kupsarzw7RyUG/2Qb0j4AGWH7NDTnEhgSmjEMhx8XYy2TFfxp9
         NhQLxNnb7DkGGI2OjwgSFYyCZmue/2wxXFVYh4yxfx9/lpP8DX/pWwWUMq0GlytFI9q5
         eCqi3DeMXbuOBTmPzVBXmxHmgiBfb0jqr04eN76kd5sT0vOyldK3vL467tAD25H2oXr7
         sIGaJA5OXWpOPqsLd3CaYR3Jpo3Zr2m1JB9XecQ3I+qUdsfaU//++zpISvx/1VHv1hmn
         Qun9BTAsP4m5RUlo/wORFEhnq8ByNUy3x6Cv2m4OaWqE/Wh52sHjXQqu1arw45hQ/Y9f
         ATFA==
X-Forwarded-Encrypted: i=1; AFNElJ+cgbZbjAh5H5dUyeC9MdN73WUmP4U4PlOP+u/fTe+w7xQDqZVVZOFscaVVVKcc9aD3YCm4lcbkZ02WCBPX@vger.kernel.org
X-Gm-Message-State: AOJu0Yye6ziJqfjKAs68c1CDgiiMZLS5q5G1zlZlM5/SWR3kNsDEOFTa
	y2APg+vB6Np2bmpY7CaDKY7TiYAmC8JxnhqoIpZ5DtlxXXn4UKSqV0mFPSmcQWx9gFsAcGF54ky
	NmgPKp7BePFzEwnqX2ToyVGmzDrfD7CCcrfJln4IEiS8BOn18OjaIWLnQzHi/FX0U4bkL
X-Gm-Gg: Acq92OEX7a3BhEzSqihOaC3+Q59Op9lSkGHSDeKr/952LzGImdZ1BeylSTXAN51jRMP
	BE24E95IYfq+PyC6yvIYZBYqWvCoFitc530E7+6uTDVh78rquF6MoicvtMVyIwEYX4VYjYol4o7
	kKBvdpo1/Zh4sGFEqNx98EX+h0wfiFOWatl2Tm2E1m/YDbi9/YHha+EPNDDBzUT4NNa+n3LHIwM
	oMr5UV/4dIauNDmK49rFrtwZDBXMN8/eSBOCvHb+b6g2Y0gRv1npVYeOIcSTtpfiEWW60AMUK52
	zM60JTwyUfxLiwYGmuSO4/8Vkvvp2CUBdLBzIc7IE9Rw2Ex/kjONhIsGEVISiYlS1vmOQzUqv8M
	H7Z2xyeCrY6x4OCQiss06bg7rcxBlvDTJyXZ401YloTfiRZglfls5JzUhTFzuUg==
X-Received: by 2002:a05:6102:3e15:b0:631:2472:e832 with SMTP id ada2fe7eead31-67c7fff41dbmr8318248137.8.1779801089264;
        Tue, 26 May 2026 06:11:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3e15:b0:631:2472:e832 with SMTP id ada2fe7eead31-67c7fff41dbmr8318181137.8.1779801088719;
        Tue, 26 May 2026 06:11:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:53 +0200
Subject: [PATCH v19 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-5-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XWQU2M8GNJi1hTXicUIAjauPbHJI4z5KvicdSabu0NQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvsBil2ok+w4T6U//UrDGniLgPdz7SgFTDmi
 XqSwfkI+kCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb7AAKCRAFnS7L/zaE
 wy2XEACuFrcK2feOu+lrKAd8U6HtwFQlksXURX5scLbVJhJwrkfs+36Nm1ElbTghc/YDaixxI0t
 qTcdKbkQNAY1Lj0H4hwEMCVdQcclcPofcTtvt94EuA24riGm3o4z/kU0hOi0kMMftMSq02uJlS5
 CxMy9RaV5m4P3e3+OgX7e5ikeGIM/vmLAuo9Fz3pBtsSI+OqRNbhFEYm7XO27Up90UfUl/ul99/
 Qtj137V3CbapUiQUVCVKarbJ9+BvPMQD8xiwv/+4Cefb89tQmWvWFFJVarRYuU0l18ZJio1As/V
 csVRhBEeplMDqc9pbunOnfPUBZITMbOMcfIYv6y3g9VjjPpw8NzYRthGKf/1ygyPKzGHgThLYH4
 GNV/KrIZeZQztPmz0opQ+L11t5SRu3ua+jIs7QwWkcS+YEwMgA0lEfn3mEFGQOe/iqT51Dtbvuc
 GuO8bxp95l8fyY9N5MUaDhG/HE7IqertdXFEqw3Nv5P+RVfmeHwclBS9kJ/t647/Atq9nR4WK0U
 EX3eTxE+sl9lCyID2eYPB8me3Usaix0I2km7PtvZlLFHdCMUqSEMBPDKKcbaE3j6nvYNWAx5ta9
 YuRzKQmNzJvbXRMsNpX4CBReFikdaUvHy2TXG/WIbTVxZybsDRXb3sKfTC5SbDA9qGweBHpS9mD
 QFqiM05R4l5US/A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMyBTYWx0ZWRfX+0f7MMoGVWR0
 iMYkofycJz46rDxpNLX7Kijmyd8XvOUrx1OE/gksOvoSE4dOMR7vWUznJAj7+/qdIK4MaIXfHIL
 nzmVoBl+4SZiPyRjS9g/FEnR/mcANgbuqH0TkrHJF2oBCkzWXbb2xNDwQH7p9OggG/G0CYnD5bb
 w22HsODclGhEHd3/Jbs9b3kjbNadHIaAM78UrB/QM5GkCVV4HtB9ZSv6/49R2AL+ZDypbkYtX2s
 0/jAIJUgg8SXAMeSwEOheFt3H8D69SDOtdVe+Vkk50G3gXQK9bNVqhhLJaI9CM4Slzs071GLkib
 ZfGOltSoqKLBUYQLtQN+lr0kklBAKlsD6BneV6MoykRSyA5TfbuSPtuoInKwbjWZ9kStGNOTwJX
 7xqPoNX+e3A1zXo6A7YBKpQd5Iv90hs05o619K5BCKyrg7Uh3T6ss6mKxxG8vdW4z0w51pSEdNE
 2DtiswGibHEUvBwrJfA==
X-Proofpoint-GUID: zFwxxobDuxb1-27w3RdodhTHkLz38IuP
X-Proofpoint-ORIG-GUID: zFwxxobDuxb1-27w3RdodhTHkLz38IuP
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a159c02 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109820-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A9F55D631C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2129ff5261571581a2c086c13dd657dc63e16f90..04fe1d546be73f074c66c4a5712ad65717e10929 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


