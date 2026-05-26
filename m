Return-Path: <linux-arm-msm+bounces-109818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDhKLv2dFWr9WgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:19:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B605D6482
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 15:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1222E32CA2C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDF73D79E3;
	Tue, 26 May 2026 13:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIGObwRv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVYcoWf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468363F8883
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779801090; cv=none; b=Q7Sfc+GHfbcFrQyGEttCgiiTAPOSYu9fjp6iecxMJizCvsDra04U2Q18tBNBTEzoCwARXJCToyxy4R8HNI5ZES3CZ+OPBcnu0pt6CzSmY6cHjg4yGo6nJlqVYoLwUYszpuwNoE1wY2k77zVDWQmhP2H/tyAeGrDsqnJrDJsH4/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779801090; c=relaxed/simple;
	bh=8kt/r9HrIy2XInrbgvfr96jusMTBkm3qidl31H1ffz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbnmZGPnQOoUPnamOlMEBlO9L/nhSS3CN6ESXUYsu/rZLjsCKxyeud1YE12/1ZXaQr/HJJVRXQgSTgnXiO6jMMMESAOD/9SpZnLBMfF5Iq4LDm+ct14pSuvW5Y5ceYetolTGuex61QQCmmOam3OwbjfdsJpJLBgN2J5AXlt9QPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIGObwRv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVYcoWf2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsNYB2705491
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=; b=RIGObwRvQEsIuu83
	TIxVHDCq+f3ZVlf6oD4onWTVPk2xx6xqVLaLMWqTXdxrB+C1v0e0Okp8CYssmaMP
	e/LHB1CkaLP+kLn2q7WHFiYWwf6yZhbgHBQiPH97zS4dfiQdSPwQvjxA989qWPKT
	nC9FtJXPuQ+RnoDPcKgiRjMub+pmYPDRZr31yt/pzCKIeZEhnfXoCbEDf9UT8TPD
	Sd29FPdXAWqa0lKn1smUNPcinw3aDFXJIHNUGkfkcdVLXm5EBu7UExZORHu/XttT
	RD04vUyWanphDh8aF+dZI8rtjnNDGAft+GhmcKnD+sh6V8ap5QyfV8uzT0vGzZVO
	wLdK+g==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vghvjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 13:11:26 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4856ecace68so2239850b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801085; x=1780405885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=;
        b=JVYcoWf2oFLDCF6+Y4VfKyx8iYOBDFkdWkyRunp9scIRIoTEuN1dys7UPsH4CyFvUJ
         ewbAxM4mak/DF1w614WgmzpplzH8e0whHTGQHoVVgS2ye+DjlNMVOKbkuEEhmI0fRJKN
         ntSwAGEiNVi127T0EuGNL86bN0HSQUmtWjEWKDV2kkxU0ZXuC8Fp0k040hZB3w/i+Nbs
         I3dY9d4ogh0HykAx7Y8+6SxZv6kqurYAPUf7ZicZisRh6dqPj4iiCH1oLtra4YTP7Cq+
         BuXm4q9yldSIW7/97wRYSDIhAFvBSVD/MVo9RQw90cD107mZn4OH5lcet86bXRl5aYt8
         KWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801085; x=1780405885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=;
        b=hqOqprfaj4xp5hO+XuiT53bGm2+RLu+/y2/Zzueq673BofzmyArp52m9XlTBCEAi1I
         Esowg9Y5e8yyIpDhyIozUiapHD4M1o1oX/ine4b7aU+iysidc48rK8bzyZoab8Ge5zZp
         IPUFSEk/5+Q2QMuuNBuCPf2K1c9GF3Jo9e7XYzdkhuNOK1W7MqkDzl5KrcxNJ1E6S5py
         hNt5G7RQxdHKXFdZpEJrMSN5R9nFz3Ot27JMc62Ypqqb960YvX261uU10ha+DNnP2BOC
         NqEelMSB5gj+LXzd9LEoMPzduVYb6YmOBB3PBRsHbmUsQL085cweDqLndY2vJBjPtApX
         0//w==
X-Forwarded-Encrypted: i=1; AFNElJ/Gskeokj32G+UMVYQb0Co8yZAfg1yqch1g4gtSb6pXTfciW4OW6BtuHuZrNbDAU9UVK7V5KkYnYF3T2FcS@vger.kernel.org
X-Gm-Message-State: AOJu0YzcbKqdDqcqt1CQ4TI7bjIbUGFRuh8yZQs3oE4xLC0oyOSacybb
	TECvXg17kpTAx3uJVr53bd+u1AlQO1NKOt+FvZnRPxjE0QUNbj5Ldc51DOcjGJkOWRz08HWXq86
	6U6xK59bzDV7O9ybguf8eJRjNJs2vx5twTEg3UHDLb6/6scSsoUtWBRnAAaLaRr3d9FMI
X-Gm-Gg: Acq92OFwr8NPQxBa6IXUbzLUKogxTFd5uZ9RqMjTc38+NG6xAl2FKIc2iomeLSWowcm
	rxoh3MmtFZMOxovnJPEF21HZoDCrUrkg8d19fWyiwDw8ClzdZgim3890hdjAWbV34DFVfOmJvf3
	8TJ1SBks5t3RDaB0uJJ7931qAb04wzThVJi98Gbb/c/7bLNl9xjPsILIde50PNPXETy66kD5qI6
	WUeYVoSfb6LXHz0NjYOzYXH0uo4R0bRYYS2pzONzhzCTGzWbWvGdDrTjrwB3QJ/QMbtgBIoLKDs
	J3Dzoij9FbfSRWBWDvGqa6vdFVOSetjsC4OTJXqbnNjU8ktlIZ+6/jxr9fW4gBtXHvp6NAkb43a
	ScEOOxF6TOFu7xx90dvHyd+BFjmnUrulczQsPu0nJYKGhavjDdT0=
X-Received: by 2002:a05:6808:1a0d:b0:482:4dbd:4fe2 with SMTP id 5614622812f47-48549edd3d3mr10664317b6e.15.1779801085499;
        Tue, 26 May 2026 06:11:25 -0700 (PDT)
X-Received: by 2002:a05:6808:1a0d:b0:482:4dbd:4fe2 with SMTP id 5614622812f47-48549edd3d3mr10664275b6e.15.1779801084959;
        Tue, 26 May 2026 06:11:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:51 +0200
Subject: [PATCH v19 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-3-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8kt/r9HrIy2XInrbgvfr96jusMTBkm3qidl31H1ffz8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvqAr/c+zOJnBlNFR6ajuIeqQEySV5XeIfMv
 uCGrvzCJgmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb6gAKCRAFnS7L/zaE
 w7mQEACvAXElwu/GR7rmlovyB3QgxwBOCO6PIzDULjvU9h+onJCDdyJP9XK4gBgRgLoDKQ30ktU
 ewZlA+VfBMfD5wN7K5C6ogMpdw0PvFuBoYPL+vMkL/fy/L7fI7upSqy+W0TdMwFbr229q3u6C6P
 PBuuUGlkCOXhy9EGGx0p/TwOc6eNnYKbyIUHtJebx/Z1c/JDMoNUYaFqPVUxIr/Qb8YjYzP4bwb
 CAjf6MZf/8GYrmj61MRYVaqM/u5Cb3/VR1NNYLxzEhgVLTwz9sfm4kgIusmrxfhKxYjPbcsRO1Y
 /hQcZ4rpJZkPiA3noFslaF8NPJGkH+6pZyFgjpKOtjwFgT0/MZ3snJt9VX74ca1QfJRObgezzuL
 Kts7U/NauCGTBhNKJbTAazHYuzoPpFKXuN4Rl+nCR9dUDTo3c6YaCq2Po3+c2u1CdUmlBvo2Wzj
 6+MneWI6OxTwlBdz65ssOha/7lSNyrfUot78zsVGHDViCGRx4YS1twZlcCiWVvFRxxpqzvYwE9U
 0TzGQMjhcjxSRtdSm2hTUVOF8G6KkDPn3zznJ/B0RWWEtUndeAL+qhrUEcQCGwCN3NxeGLPDZL5
 RQhL7c38eXnTKKDY4ktYEcvSCPX91lrxf/UIo8qO3QH4RObfmFmKQMUYA+g73bEU4XFKBU+6zIa
 mL86zae3L8y7ozQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a159bfe cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fpi5mME-R7S6ih2LYtvkqjHEFYDJjn27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfX1/l2amLlH5QT
 W+Mkybiiwf6uQijE6sV6yn/gsYlxq8XKOsQ1t1kb/sm04pVVmN9W+aPLUlFSZj1opPr6KTKhLya
 Qiquk4vZwUg8RxPE05ReBR2yOe/S0iqgLo98o4e+6pMJ+YF6Gnocw8h1UaaIx6eUZG7z/VvaNsh
 ul63A3FjxOhXG7rEL4n26env0hRutIOPXOgHvX4wHUSBIWsCRhRBMd662GkyXb48f98i7AUuWm9
 NOzAEhCnY0L1jZ9b1b0Mm7vHjKDnh3+9XYe0Jbiykv0EaCbmJ+sYtS8Q2oRlSNGnyRTz6D7/YRq
 xoLxnFbcOB5MKAzIUG8tuYEnUB8b8lKh2oUPsSLEllQ367pa1GLwEmUnUL7uwOVHlanksX7IhaY
 QPqFT0UKWrJt1p77qOl8oeqnIhqbpfOqzKg7YYjTtPb+18n68DYNywMbXbS3v+jevx/EVTbsBgx
 9DdhxvWddaBBbOae/vA==
X-Proofpoint-GUID: fpi5mME-R7S6ih2LYtvkqjHEFYDJjn27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109818-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 15B605D6482
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index b3d36ea79984385fe0d05ce56042d3e6e3030c5a..1c62f845ac0b956e311857b93f5b504086662f45 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -397,8 +398,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -863,7 +864,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -893,9 +894,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1091,14 +1092,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1111,14 +1112,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1286,14 +1286,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1359,8 +1359,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1394,7 +1394,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3


