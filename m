Return-Path: <linux-arm-msm+bounces-118779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OMfcG07iVGqqgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:04:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE94F74B3E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mtKQ6aQh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dVZFNWdF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118779-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118779-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79D51302EB0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C6C416D0C;
	Mon, 13 Jul 2026 13:01:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57567416CF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947718; cv=none; b=R1HxeWAByF99ZaeAK03p60KGu8a+bIjgA/vS8XtZAhI3a88tX5hFeqore0t59NqxoS7kyW8iwLMD8+csqfym3912w3WWc1E2ZlDEHGZSZjKfnk8d2Lvu6lPc1n8pcdLmBXZ80GxkQIOVDihl6rIWZhkrXpR7uu0gUryLQ2hn8kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947718; c=relaxed/simple;
	bh=vpDVf/b6zHPEUgtVCAl2sRJELM4MLJc6gtP24/up104=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDB2clB2uRP2ERMxMjIoqAt9QWSOnaQEP3k8jNT2Q12w/qUJyx1S+LBB9uTV4HIlAjPxYFnYpPp9RrrQDodFgcxc8ZOD3lClNmWbA1yYJ0O6MFkGF2mGy//rj5Lm0WRn5d46WxyyZrw611SqMK7Yr8WrECMFUf4Oij0eHIdKvkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mtKQ6aQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dVZFNWdF; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDg4D1480856
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=mtKQ6aQhFyuDQE93
	vLS0PLFWn+3ssts+aKobAO4Z3qGaqUVXI5gjuS1xu91JAaK0kAk/MFI1n9gRiUXK
	VZzGPSNz7Bp8q1PLeYXrHFP1zBkaHghZt20UDZxw9SVbih6HTBrYynh9ebRMxzq4
	x7idrnW8SkVIPMMgND2OOJ9L5ZatDG6f1i0qL5BlTCGbRBX68aqkgW7qgO0zmXe1
	exmg4REXsTFM0RWl+20r6ygIGPNOxnnFnAj7bIJimxGs7typmqwCVsb4VRF8/iPS
	4TOkXNTH8GpUVAUlnxv++fl7mtAbYY+u2zDjZ7DLmFdVMOxrhx523pVll9J1dIRf
	6wTqRg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrsqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:56 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a18bd9c3caso4633780eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947716; x=1784552516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=dVZFNWdF4A1JlGeWpiXaOtiTdGCUNeInmkwmovudvfh4wodJpBuar1rWVS3GVZ0b0Y
         mqoPnmUaBLfXyWPP1OPAvNKUqNypwj5Vf3AWuuYBVTx68FfW7wmURaUTjo13bjNnyrLf
         R8GWvLXcD/aZgTT3Z7X9IOAmLSgcuK+kqEXvdtMVqgk3Hbt1eQqF+plcWnsL9GM0ukcd
         hDaEbTnKzjsTRiSQq1+0A5b6QEzVlV6nxkYNFFgUQphQVsKb9EGYMzyK2GTn1NjLHX3q
         aPXq62j4x+ei3phtojSBlQv3uNpP/ZxM7alNM/CSWkINALnVH8435HLNNplaFH/UFZri
         0mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947716; x=1784552516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=azSSyyHOJJkK2yECIfot853JIdHrRNmAI32PIRinGCTwITG11FrDlOsr4HMP5E1UVU
         dBxKjd9KRL3Z30fKad/bMVphIArdaF0/B1hWJ1fMFZJdR/W+pclHtL740V7APsbRk5tv
         femtWwblMIfQ/0/B47+BoNsHSmzdKJ6ASY4pJxv6u3GXISxDf3SF7hFx/CdsDnmEqjfz
         H8gd1zNQaO0Sb/9LXvxr6nxi4U2NwVqL7s515J25E89q8KBQQKR2U/DJyZZAlcyG7V6+
         meE3a8jEAEFCNwaESc0RNawHUKg05L2rItDpA3F7i3rkRMBPTRMViIEZs/wcMBOY+jKH
         OnpA==
X-Forwarded-Encrypted: i=1; AFNElJ91GVdF2A8fdj2BqRk4zanPFvGk0K2GYtKDvj6Rt+YGSsfjCYQvOwZBKumppvoJGLt4vehQm5ITz+SsOuC2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz2La9/WrTCxIaCrXimBng+w55Ayb5qlbv9kr2Wi1Ui7urLVzW
	E4TDjVw50owCrhPGbMTgNAnjpUoflDon/nDDcbjG7RPde1Goa81va1++tctQ1ZJrolJjanJ5yIg
	KPcmsdVwRcIz3h2owDg8HPZ97DuBXzrYPnkrWIaLmnxwhQzsJHxT2k+VEVp2x3nrvTw3Y
X-Gm-Gg: AfdE7cnKTR5Y2gPvR/wUZJMLqnj32Xf3sNiOVEV4u61++8sqol9SrNaC6dqqR8dQye6
	W29kUMzBE+osJxBMmtFiDlRFcRNSk4BziEeJe3ec/FSjCZCD0bPg+SlgI/JLjr73AZqmCGHdeeB
	+DI9aVMzpfsIjl4alWqY40sEsExg4TX00m2GDA4kk41wkc6mY573c4rDw5ppm38lqnTDTX/hgoe
	ebxyqU7+o1aCsNI5AAEHKbMoVDMHQR+qRB01eEd66u/bBVurl5fcuLo6KH+Bqv+y+LdJ/Id2bkj
	Nos/1hGWa61cTznJkrqPOx/oMTCUspzNmS8R9ItYrISo1aGhrLMI7CYUvTsINpAdBajzqclHqVL
	Zc49MTYia
X-Received: by 2002:a05:6820:4cc1:b0:6a3:916a:1d26 with SMTP id 006d021491bc7-6a39a8561bemr5855920eaf.61.1783947715880;
        Mon, 13 Jul 2026 06:01:55 -0700 (PDT)
X-Received: by 2002:a05:6820:4cc1:b0:6a3:916a:1d26 with SMTP id 006d021491bc7-6a39a8561bemr5855857eaf.61.1783947715189;
        Mon, 13 Jul 2026 06:01:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:10 +0200
Subject: [PATCH v21 09/14] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-9-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGeHIeb8ttU8NMHmfvZe/dnHD8TlSqP+D4CC
 DKyl2r0VFyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThngAKCRAFnS7L/zaE
 w3GID/9wtsZ7eG9siySdL9ECGYbUZMDbkEeFrIkn7nhWh+imlHfzg+aps1ekYXqrnnKoNpMAcYj
 s5S+a7t13UfMF0H4ezCA4SmKeySbw4Xza4+KOINoRrCvitkyhrOhRnOFTGtL5OYdsxUi8vBYxfA
 bhOYwwMqCw7xtvs39WG+W+ugZyCQMBrvMOVao1ZTs/QOVw5JdfTK7Enjn6CPI047t7+XtVbdcnR
 AO8b52ajf+00/8XS9y2hWNMhT5hPJq1QjkwjaCBTObA23ROM4Z7cGEXjrn0TNSwFOGdiBaI7voe
 FCJ9VyAiQ3yRc5198Eni4HMzXj5sqx9F5X+ZYs+sd8lJrvAld3W7gZMIZ3TJ9SZ8cpTzqmMqUqv
 pwheSNQn9xKZ2M+opu+1hy7/26q5i+Wk/hNPr8w/gYP29uPGH2/ZCBTwH3mHbK4Auw/w8oHI+aA
 q2aXjx9NPwmqdFBvo7EHkgNDmckjNdXVmbg+pmujnI8AeKsKpVqartHSq2sVSrE4NnFPbjGNlfJ
 GYyJNVtENy8vNNqtCs2rbm1CX4Cp2nNLnd4GPm257Yy/HS1E8BhMfwaVKgbqszK9Zx/smc3DJvT
 pOtMoWNgul11dbGF21pBRIe4dSyZoJ22b64Quq16v7iBe6XsVrKSjj3xPBP9JsDPEYNkrtYJ8vf
 9BPGsifSF6T4yow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: _GNY1BIazNYKHbSSRW_X344vBLCE_Fq_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX4dVPb7wux+nC
 nsOX0zjLlIdRkYz8lhq3Ev6mKZRv/l2LQ5hefqvyLcsg53iEmqd2POPguzCHmsdmswjzcsmyUI6
 Wh6Uhg5Sx3MiTKyO+phxEM1lnFrZfpmM8tsjRZvixEZEjgNwVpo1JYAPehMlrPGnuz+sbbmsFHx
 DGPWNAS5GfYXJ25yfa9THSNs5IxHjAeGkyX4ccg/2qZtnpCrDHP+lYHIdLgo994ZQp9KfZbkVKf
 vQoZvXB0b89exTvoKDO8VZBGIEe9W5DDQOAHohrOUem9nD5z/N+HIR3qA0SSIGlOXUP1HzVRjzt
 BzSxZ/ZkYSSKdg8mXCr/kE53y8eutYUK5xhsX7RfUy6o7t/p+aym+jMUeGEZ61Wl/shIxHar7YP
 gDBHjyy3hsWfLhlJfPBQjR7GwEqI7MG+AseQxilM7Bg0A+RoSb9tkN9K+8E3K7zTuawt4YMYuFF
 smcAjZDKDcSrKtBEhZw==
X-Proofpoint-ORIG-GUID: _GNY1BIazNYKHbSSRW_X344vBLCE_Fq_
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54e1c4 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX6CgnFMgvD6ks
 xWkNgXl0rNVGaoSpw+/a+cY8s3piiK9NGJFIVWS17TEG//9g3ZsbPWJtuF3dep4x3j7V588WWfp
 q+mAcNsdMRYnWH0bC87yGOL2RhzaKFE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118779-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE94F74B3E4

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


