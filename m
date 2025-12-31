Return-Path: <linux-arm-msm+bounces-87094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BB0CEBD33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E70FB3032AC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 10:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE69B31ED75;
	Wed, 31 Dec 2025 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9LalVlH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HfFUiTcz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7370D31578E
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178556; cv=none; b=R9ZuIeWQwtqZHphv2+fSZ02h0rLyPFWLX5ceM1u47Yhn4nQ/EB7GuONLmUJQ57Enzrus+BIyPBvIIweOdCBa2eWDwE0xgtdlAgahtmcgc0Qhl2nhlyMu+VCnEGGEhf2Jyhh2Rm9OJnsuwgU+fSboFlVlXCkrJn614O4SREddCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178556; c=relaxed/simple;
	bh=HaoGokyMCKS6sYN1xubOMqBe4hgsaEX+B8nRrEYfBZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VQjbROmnTmpF/CcbD7Bbc4r1pRnxoJjH0lcv8qe/V0nlJxC1O1i97eULEudc0A1caQEEbnAXEh83XKSGwlMUXsbl0cNgr9AbV90lS4ZyFeKgzf3olptW3sPoBLk4ICZqPYm0cBDx9yPNQdFGal0wJAkr3vndGEdK0pgm7yeCnJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9LalVlH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfFUiTcz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUNZYCQ1286319
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=; b=l9LalVlHnMCVESuA
	ktNoLFmYgR+yMVeRPmZ1JFaUS088FgaON98gaUXZiHac/q7y5EeYEAVhiSnb1ZAs
	bYT+nenGTAW/98+5957nIK3Pr9Yc487SIjLLFsPE3gnkNCbWbIo3ZBBxFrTCoTdK
	khuLOhMy8IAWzxCWzztVs4hz4Kcl5cvgc8fD+mE0Mfp4uZWixQ1IaVnRZ1KWAq41
	edQTCHKA1PUAvPJLc6h0JiA83UANl8JKbLs7O3Uf0ZpoojkDqxfTTdBzgaYir3SN
	77Kp5o6ebyhoMAclhFdxW9LbhvNNHHTcT7l7pkeRIVAhRR6276p8C4+OyjObaxgD
	SQHIsA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky2gw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:55:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c240728e2aso22644436b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 02:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767178554; x=1767783354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=;
        b=HfFUiTczOU7GZCcdWbWDLmb/x3DuX+wplIuleNmadADf2e84kdJGpRPnO7XShR1VKS
         pXqlsl2eQVjE4f6YPvIdDJvARxY/1S6cWQa3aau+XLDKEnxxw0vj9zOtajM4GrONdiJQ
         Pr0/YkSJvEtRbVXkcI6z5twBe04IDjuxeHtBrSz9i4JP1ZY2SITJrI8nWf4MZ3hBUJYg
         Y1bzY6Mm0b35QQWoON7aYQdwrxDZ1FjOPss/l8eUR2edwFAuU5Esuv6LzXOeQGasm7Nv
         zd2eHs+IBzk2pVXziuulWxqUAMSxZFq1ydz20ym+Rs78Zr6yv5Wq7IjLaBc1iEmH034P
         5Mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178554; x=1767783354;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=;
        b=TvWZA6SG/s9xPVf+gRxeH0DrKXyAvlICxHxBkktcRKtQbVx0YsgmDXxDvyYRAIAzjT
         Rp+qx0NT4uC+kud/lJ9ZE2lglpuYVdb5XxdAwaFClE00Gf7CjW8spVLbkHnTxl5ajuDi
         QDytc0ShdO+UwnQHaCjKrrA6cWcluesNBt+RjByhLR87KzAnWobFt9904zgW8NC7JG7A
         jQFuOVjW4SE9cVMs0eGLBB9S0qQRhz+z0ae4vLuvKiQ0uF74XSvpLhQIU/ETW/wg2Lh7
         zj5XQZziddEL1IKUexigmIpgUxrfSfv5P6O4crEpf9qmqobxHhFlNfvu/ilBdU+I03Jx
         wpjw==
X-Gm-Message-State: AOJu0YzjUpmdNddBkE6qUqOs/kK0sGFVmVC6s7ZhanXmE5SAGyjljvQ3
	rPibOWgyc3NmafpozKgcU3KPq2LFLfRFV4LevTfaw2dsn52iaPLhQWnYyPcAQPCiO10IU5lFt9M
	qFwtx+0g/36uClV02k2My0jZ4Wx/jNOMRJhiVgL/1DqhSz+Wf1l6hl6bWASWXT9MJUtbu
X-Gm-Gg: AY/fxX638po75HG0G5X+8w7c91XfPPXfXuOaedTrfSmpcBoDJCC/nF5HMXEBEhXpfH3
	Q/YXaYyhYjXHOFmnzAAbWFj/4MRUZKvg+q2ZqBuX432Vw0cJMz4GH78EO60UxyRlgQ27bGPqoG8
	RjMMcbAP6sFCfbGdhMCDK7ywY9paAiJUMjrhcDUWuNQJ+wdPNuRtG5sXh5Uy0XQ5TBVMDEs2sE/
	TbG50aIVWmGDw881iopa6U9JlIPBdsL4R212FgRUQ1N81oxG230jGgdFFFNqFyTyji86asOUamr
	tOo39fmd8tP880asfQ1c1TAJpqXNyVgfv8DZvGIMbJI/LlEgpHygLLA0XzYIkWG+s+KVxvb+0rd
	pcSf8/GXm/1A/FiZK5x6WLNX3bg7KLLn3+nAKBg==
X-Received: by 2002:a05:6a00:348a:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7ff64ec6724mr32190505b3a.31.1767178553533;
        Wed, 31 Dec 2025 02:55:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGioiLvW2U0joeR5pbtZjSEPSozpQwlq9uIpJCK2UPjGGzU6NNfRTPRLdM9fVlDl9M9HcekTA==
X-Received: by 2002:a05:6a00:348a:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7ff64ec6724mr32190489b3a.31.1767178553048;
        Wed, 31 Dec 2025 02:55:53 -0800 (PST)
Received: from [192.168.1.102] ([120.60.65.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm35616794b3a.45.2025.12.31.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:55:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
In-Reply-To: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] net: qrtr: Drop the MHI 'auto_queue' feature
Message-Id: <176717854647.8976.2100798756796791971.b4-ty@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 16:25:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NiBTYWx0ZWRfX/mKN/Fq0DEG0
 fWpWjfIzcfoZFv9BwJRjfT0IxdFI7tgeqpLIvGCwrXVVscr4DWlRCrK8xCAMhbzcSSd+oRdDI8X
 xYS3YESvtQn669CXKxg94ZJo8lMjmQ1XxKcJgErwWipdKXOVETGqwo27k3H80GYIdeT9PyRrsQL
 qKns/ttMy24jT4saPubVjSX693yQnHxoVm73WNHGS3PYQt4DV6z15W+xZddNYHYWYME4TcBsQxX
 e0zZ6Um5ccgAfQ27BCAZwXrdqwx9W8YbKT0ysqAHZkAUb6xIxpdYRp9mqcOli+rPDyc8/RY4rH0
 EkXMCgB+3OnQobU6DyB4qbZQWsT2tpWUPEGcuveLOT4B9aqdqLY9eXrizx/dJHlzskC4LjTbgcr
 IFBlDSbMIOZw/KLfZbbd09kLaIhIHG1XIjdPQZK1U3eUZPsfXptu98gcJMV12TTF1uYbYle4rHQ
 njzzF2GaAd3ctRpZ1Tw==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=6955013a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=+SK5D59PVgoENw9OlSzWFQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d1LwL24QG6zMnwvM45oA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: F0Esx8RAkuoSmeOC-kh_UzBufb4aPWQ2
X-Proofpoint-ORIG-GUID: F0Esx8RAkuoSmeOC-kh_UzBufb4aPWQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310096


On Thu, 18 Dec 2025 22:21:43 +0530, Manivannan Sadhasivam wrote:
> This series intends to fix the race between the MHI stack and the MHI client
> drivers due to the MHI 'auto_queue' feature. As it turns out often, the best
> way to fix an issue in a feature is to drop the feature itself and this series
> does exactly that.
> 
> There is no real benefit in having the 'auto_queue' feature in the MHI stack,
> other than saving a few lines of code in the client drivers. Since the QRTR is
> the only client driver which makes use of this feature, this series reworks the
> QRTR driver to manage the buffer on its own.
> 
> [...]

Applied, thanks!

[1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels
      commit: 51731792a25cb312ca94cdccfa139eb46de1b2ef
[2/2] bus: mhi: host: Drop the auto_queue support
      commit: 4a9ba211d0264131dcfca0cbc10bff5ff277ff0a

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


