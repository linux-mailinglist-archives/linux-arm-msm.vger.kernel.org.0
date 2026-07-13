Return-Path: <linux-arm-msm+bounces-118773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gSZ9DGziVGq2gQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:04:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D5074B3FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:04:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YJFK4Jks;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="L0es/OtL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118773-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118773-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83E073048757
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D6F4189A1;
	Mon, 13 Jul 2026 13:01:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE937414DEF
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947700; cv=none; b=aeYJUSO0xdJJLsxMI1BYIyyO8ZM8y7i3ISvuLHD+tkJ7sBxucYwxy7c4Tq8ChO1NpPCcHctlM67sTpuwm4JC/4lWQ5AMQ7bZ+b4xZuAG+LZKovsDjz5kt/LZjUIkz6QMj5DPeah4KZXr3vJ5emTS3TMVZYUx1TH0EfIaUMX3FfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947700; c=relaxed/simple;
	bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L02Rd8CseaMPLWmc1rrL/zXmsE/o4YBubtrNkLUm90zNOK75ivWjUW4G+9PjibeVZwpwZlNhb62rHPL0jJGqFOOS3slJdaQEMrf70i360Wa9cB23xHArsyKyxBPUFJ2CjA7rW2vavlEWCMz3o08TbhLilHYOA+6E0SWJuQ+3iX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJFK4Jks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0es/OtL; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDe011299381
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=; b=YJFK4JksueG3kSy8
	CsEOscJBC0OK7MMfArRUpRlNVdIMqiFLSsK8Rxk7/0TdNSPRnBCtCiG0+lhDxu28
	BfamHVNKBqy/hPtjgzzoA+09KlodvXoxi08WlHwwHwuh08qfKmmg4prKnYwRIy7Z
	+Po+aWQwWnfnO3w/IxNsmiY4m5NlC/GAid4Vz5OyPmmoWC8xTtKjFxuJdq0ivwc/
	InSTFrya04EUXnWu5IMjBH3kixlulKAAaIDFFNYFd3lBiGSN9ygLRbNgdzkti7/C
	m6xeANqK3lYQCtkgWlJzZxXOEUZ/brJdM/WHD05dylQ6s3zy824QgqdyWq9tDtRP
	6odF/g==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3gq03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:32 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb650e79adso3303569a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947692; x=1784552492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=L0es/OtLokev+XhKupmavHb8Kth0bFQZsJWim+ALoVdJU7SLbCLiWLtlsNvlL/0ope
         nKokdslNeGv/Lra2ScowVWzQ/Zz0Wf4+2EKH4O6A8nuvhI4Ji7TrpGRi5kOy5j+c2/wH
         FzNyBKgCsbI4gwyLNmVikJaPyBsIwFTyaVcxRAYKWLRJIBOS9FAd9S9ttOx3yKiFE7Ye
         QhzYb1s9izNhYZ+rk1sBMn00R/xArxFjupXdvKocoPsRiXbMSX3nN8zmrHklYyJasPgT
         SLV+CBUo+AiM8YJ6G6PW2KHH/FuSkcW61p6dZaY5myEr5cR2F0FuGxSOfGnpvqt1HX+D
         nzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947692; x=1784552492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssHW8XScr3JWgrcOFJ5LiFi8t9CrlHFACuaOrI33AwM=;
        b=tGGFVSoOtrCNho8EQ7cOvjYdxpiV1wrv8t8rumj1d5IwCcuAUh++Vo/4EkkKip9NDJ
         Es4pJaxoProdV+avl6BijJrDG9sto/VRTa8mKycYUHWOjcMP6nHT8eDcWjlWIkuXpdLu
         NJCCNGfpuU/JvX4GWI13GSGciCsEHj/UdgtNUyrpvei/5vEn8x/RhFdrm+vp+Id1wNSe
         Wxq9a8t/dh/mnCb+u3f5cVwNe2GF7nbxo6DJ5nqNwBpV4H9dH4YwbP4pgdE9MRXPmwGL
         j8TEwnO/K/tVqyX59O7mAGOdIvkvdYTdZjHeM0avY/S3iAxa4/B6wZzoH42EWRezDHwG
         Tu3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ZMeP2WFtkJWn//sAet8umul94+OGOJQ67vK8NAYHVhX4amMUjot02U9BuwrLym9+rPktVXofAHgEsLCpi@vger.kernel.org
X-Gm-Message-State: AOJu0YxjnhLlMLyFb3QfiujpWuk/UnEYB7oxshtZSTRta5ZPWjko09rt
	zCkSUVsfaIqa8336BQVnld0P5V4YbZ9tEtLp43pQh+AQ4I/ostm7zkQJLNvekjtqgq2C95eBb6O
	S8+N4jjBJfMEgCUYDBGc6dCRXjT8TmKQ7ztpIq9y4mBFPe0RnjnQ5gbvHmkp5bt0weU/B
X-Gm-Gg: AfdE7clZEQZsagezQgePUCxdjr1Y52xulwOnS5MkhLLBhj5ANRwb91+WKNAwXuIjwT9
	JHEBHrRRCpQyPEcB/PKgAbw9vrty+D1MLTIAR124DX/BVcs+AZrhACXjr9GEhZcOWYolvceLkWC
	cAM1ZwlH2WyLedogbaca04lijqWK3PMsxWm0ZQ+7wOuTQyEbXa+yHfratm0l7lnsGH77YqnSNAa
	k1LjPGJTg1+FZA+jY9GllSAAhR1O8raAL2DdtJtCWizS9vwlS/hLJSQnWbH0p/kI4vjTdiQonl/
	06MyVTttV9+lrwbpbJ2VtC8n/KmKCaHXNaVi56IlsSX1V0h6xAvSUHC4zcPvwEb8PyLleS2b6zs
	TNvATOXHFRex6uh7Fz0h/B8XwXtA4gBQcHmrPFPI8
X-Received: by 2002:a05:6820:216:b0:69d:fcab:c640 with SMTP id 006d021491bc7-6a39a6cc376mr4848276eaf.42.1783947689422;
        Mon, 13 Jul 2026 06:01:29 -0700 (PDT)
X-Received: by 2002:a05:6820:216:b0:69d:fcab:c640 with SMTP id 006d021491bc7-6a39a6cc376mr4848226eaf.42.1783947688764;
        Mon, 13 Jul 2026 06:01:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:02 +0200
Subject: [PATCH v21 01/14] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-1-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0ZAEoPGlcD+MBsHOs7IR7iXvbxs2FRnDbpOdt9CWCM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGVtk23j9WMdAK9vTBVzx3ggbDwbf+8TN6Cj
 XQXTvzeETaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThlQAKCRAFnS7L/zaE
 w6FeD/9JqF+LVP1epiNp5FsiCS3htRKz5PlF4mocU3VrUG0etSCHC1tK4PzMixQZj2Tl7N7Zok1
 j7/LP9ZI6/0xY7u7YuY9behpQ1mex/SKrXXzCId0DC1R40Gmifr67MXasXktEjiBwQNnHeouM3I
 KggDHXo4ccrCjBc9werjgP+GRdbBDWgE4lRaxZjjTOhkqAOgUrvIsv6KL/+nhZFSP4VAOtruUkr
 kJ/nzdGXfU6u1yCW3F0XbJaXqPdvE5rEi/RlO7ux6I7OXN4T7BPztA54Dc/Sv65u8TdxBn0d48q
 RevX3zqSTgmWUbfeb3PuW18MSNd7V/pU2Z2iJgHWX/1oYf0LDfwPIfcb7Pg+GWUD1WtcmVsWd7y
 DfCgRwzhPPnDaIwoeDGYK7OBE/RdtbRR25xC++dDTWSiCVlcIRvCvajQANHjzIO7NbKBNUI0uiX
 QFmbCPLc6SAwmhe1QojBH313wPgkjP9fYsCAoTwYGwW0tvaWaoWZPKrRNlDYJhNEqaSFhZJJs2h
 tesL4V5Kqv481xfqgE+XQdYFht2EAAFxyGQRRlHfzXyNPFesmC0bxRR/KG4FQjI4zOsKmphhDZl
 d6LFkMywLBDJO5nZzwXC4BIorLovMhXH+YyUuLEyqmUDehwLEBuDoPszp1uEOwmzRCUF86VVY+i
 eyex7CGHqOPsVWg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: qUc7Pr7T-SpnoEG7blQvzQPWnrehZ0lF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX49o0rWaiTehS
 xsA0OeT7RAsMAq6PAUa6JvncW4dBUPj2R5dSoIe82fdcJ/EDvsexBbAzq0/uinrGRb6kHADpBVQ
 u7uMvr18LgyNfkcRKi3On9yjAODYeXQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX83GcB/1Giwvj
 e7oZyvBsDmf+qKAw++PwXlW9su1yZow2LARYpggEa3nW19yilzWcBuWW09BQmtH8OAn3UTQGozO
 RlOni7uk76nvYqhujXYviZDmEpxOzMvl9a8gUBCWuY82PaGjbLotknOGJG5Qh87Lf1Ow9pjaL+U
 4aKRCW6vMyFd5hqhvpDE6gudTY8vo7ANvrEKa0I+27DwzATL6wRKWenyafZls+kN8irokJj5yH7
 Jta4T76CcxP2qVoJ6GPVHGxDpNFfLu0KL90lq6yCZRIoumquB3ket4BpfDr2a6LTKvbrqE8ktrf
 MgBsuZWsraJq6/L5p5cPRL1jq9Y9yMDQqpdWLTaOoMOYRPBfdp/NU1pCMiF6D3pUHx3L4HIXy9S
 BKHlp9V3KCqJgeAAq3IHKITBTZVHIA==
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54e1ac cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: qUc7Pr7T-SpnoEG7blQvzQPWnrehZ0lF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118773-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:radhey.shyam.pandey@amd.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 96D5074B3FC

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb541c4e7f4f79f65ab70be4311fad..fb21e0df5ab7b20e4e16777b5ff7f61d2ae67b2b 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3


