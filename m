Return-Path: <linux-arm-msm+bounces-85741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AD2CCD578
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 20:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AE92302B1C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 19:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF44D314D2C;
	Thu, 18 Dec 2025 19:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIC5h6JW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFszxHMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88DC32D431
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 19:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766085009; cv=none; b=fAJOdZAQxaX/enkms7s3HnfFt6szsKIKChoNddX5y6FoYDqRtxrGcTmU2WAqW6jLqUWGgTY7ZxrpH3ed+OOwT95RiUqR1SGAZkcscDUDWJFJ0mBlVg6CLkEiwcz/FN4g7i2Mu1YBqsHqL9utYqZX+5ibCc3dOxgnFdJZtlNd0Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766085009; c=relaxed/simple;
	bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUekXqyeFEk7mK6KbnFe4I7XTwypyl2c6V4gKBe+qomOcPzyyonhImXub8oXoLgXF7yKtn+KDItdTGRdcwtNDmpc5Ux1uFVvqpor/vQHtyhMZcAoWrkpIi53fPjGYh4crOAj2oSQ2CJFkQmzUzpxsMgKccAzqeewutIMoupaRQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIC5h6JW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFszxHMJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIGskK5681049
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 19:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=; b=DIC5h6JWngJRQiGO
	4a3tmpai3afMojQofFnHVDy3lNKG6BpZGEUzjmcp/bpe8UaN35zK+SPt5D/GO06E
	4ABE1JP940T2DYzfqgEtNUcI7hnyXEpArjvRgANwTV489DM4qv7YGPvynME79vj3
	Cxc/e2h3UtZMqPbr+1sFIU69sYcVBo8zLjhTk2qml3gR4yvc0HIFxWQIbP4B/KOO
	AShzwNTyQQPr5ZiODW8O72sR913m4eszaGMLaEU6o6sNSEVoc2FA9WphrjVFKDZF
	aTFjkkVZOicAJHjBiiBeHgIpLFpkY8EjO5SJv9lanMvDo6gV2dLohtyqR+cwNXcr
	eT4GgA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhkgx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 19:10:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a25a341ebso17859096d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 11:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766085005; x=1766689805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=;
        b=KFszxHMJKLzABY8vwHPkPhAPIxERm1OagH4ZYOQucg0CPj4Hig18MU9csMnCCrTp6X
         EhiaUgDAYUqZtAgiIbz7jiixQfWVQDoVF/laJ//BERKF5zKfjIp36Pdmlxp02D86uzgx
         Hf3kXQn14gfEvsGjqteSBfeNxx5yURoXRf/K25ZPXfWolPTEA/u86Y53DseJGEPIeKhA
         W9JAeA6IGLrMlPNUDaI8wC5gANqDyGcC+hGsHtMOCtupjbhwB2CqU1DAs/aPDNCP7Q0G
         GevIzScJKMNESDBPFvSkGqG5ME0zeXaRwidQsVQaQ+DEKGebYNPSF0FkPelG6AwY/rQH
         Gdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766085005; x=1766689805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dIw8j365ikKyDlsgwjx4WaIiStWEnX4+clh7heSJnj8=;
        b=QhilD7XoscLQw1Dg5eU/A9OhF5OiRV8GV/GL5ni5jJOkGQjkU9on6G+rhjXB1K/IBD
         cpyr3wjqCX60G8lKvN9iuUk8HuIb4951jgtz5DyFRfzkipvpVgH8pwmVnneLXBKKaf+Y
         BpcdqZUcPYPP432GcfE8693UUELgDh300auApFsX6jEof6loMQtYBjnLuU165bJNFdh5
         0SAFVu5/lnb5mS4/Umm9z2j9ySfB43jEfFyr2pDovnj1WP1Pr1aUOZ0Wy46YLgLb8Cxa
         SZXJBi2vkEu18hd087jEyla1mdwPHzuhBQ5iPGTokWcM13bJPGa2DeLOrmySl5owDh8h
         AsDg==
X-Forwarded-Encrypted: i=1; AJvYcCU20ygLj454udDLU+y5tKKwnJI68UFHaSHZ77BBx/ycc8pd4awXTdVxN2LYPsLuVj/olRdlewWURnFPHJgl@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5fwk1shdh9XEqqhkgZsm47c71UTKJCh1sH7spvX1dEW/X0PI
	sIBc1/pGm65l+strlXXBi/4EomgJC6oIvJ6gRPgNMhBWDwb5maEIzH0a3FGx79s276pPGeFAEMn
	tqgrQcRZyMLDAuzv21TG7xpC+/eYHox9SOH4P5t6tdvPwigP4eF8CI6Jb4qKj94kQOq/5/aYtfQ
	VD1x8BY6hrrJBBxWmnF+ub8EqoAe0z/vCJXf6Ik2qvIjg=
X-Gm-Gg: AY/fxX4TpwKxLcmnigeAjPjlYUxLo7rMs2dAyucdVKLIotykVPvIay3S1btvbyvw+C6
	08J2W6MdlvPCOARATHZgB2KXQRzK1TIAgoSDoHta8CB1TrKO5FiAc1T+i3hbad4ir9NgsbACMcJ
	0CE00+uTXLwKrqgMOZ9lJJMx5OKYlkQ2EwnDQTeITPfFrLjH2TlWpqzHdzrw7n0eDuLxGF7S+YU
	BlCQ8Nuhksmc8UV/Ki0vvWTJ8c=
X-Received: by 2002:a05:6214:5903:b0:88a:32db:ca2e with SMTP id 6a1803df08f44-88d8859d814mr11385556d6.66.1766085004801;
        Thu, 18 Dec 2025 11:10:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElTYAdoPhfH6LxXjgHHJuq9GB+MaXPuKPdY6tm4KOAmStZEaNhs0H2TbaWVu8vQa2PTPIgBrIHJI1918I+nRU=
X-Received: by 2002:a05:6214:5903:b0:88a:32db:ca2e with SMTP id
 6a1803df08f44-88d8859d814mr11385106d6.66.1766085004406; Thu, 18 Dec 2025
 11:10:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com> <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 20:09:53 +0100
X-Gm-Features: AQt7F2r9lOf3zDCFBlKxs8sdhKMbeErBZkq0-ox7XPW2t1SLGzCNcjhrK8xkLWc
Message-ID: <CAFEp6-3mHFYFPS=iakDyWUknDH8z4qOaHwFLuP=Qz1PvYSL_XA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxim Kochetkov <fido_max@inbox.ru>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: FmnKXATI6m6LHvizO7hbj7Ys-uLa_rHg
X-Proofpoint-ORIG-GUID: FmnKXATI6m6LHvizO7hbj7Ys-uLa_rHg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1OCBTYWx0ZWRfX2D7C9a34AExR
 Bqdnq4TIugwS1fn7tV5T2F/a3v3D/qwpCUBaTHpiCDhxzI9qLbE0AeS4WuHTNh6SamtX0Gijrq9
 fy9PcpfukixGPxmskWNrBaEMwa+Q1qcEP7Iyc3n/F9MhlCwpQpVJfa0r5/N8zfhPo/5aZrvyrw/
 N7FKE5jOCqMMrplifNcLA/eraKSnZZQJ/4XeHHdpTaE1r5eiO/BLn+Ryyb22vCZs9lmrTDRVOh4
 4x7fap0YSUJSTjhcOtZJI49JWLlqZNHzzuBZ3CXDkfPUAj+ao3L+oKog2NXhIsywsUUXDPUGFT2
 g4NhX2JyZxgimP3QFdsxrx5pnXel8Jvkd6W10/U691hYOt3RYZ1dqLazb2kP4XZxegjWHvQ7q0L
 VXTo6dYq1yZ2TTwdoYNXVpIYGX0YOQ==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6944518d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180158

On Thu, Dec 18, 2025 at 5:51=E2=80=AFPM Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> wrote:
>
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the clien=
t
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callbac=
k'
> for the DL channel may get called before the client driver is fully probe=
d.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
>
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code pat=
h
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() i=
s
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
>
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manuall=
y.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. Th=
is
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
>
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
>
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffer=
s for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation=
")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldcons=
ulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/.=
..
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

