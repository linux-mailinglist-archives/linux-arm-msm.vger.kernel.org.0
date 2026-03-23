Return-Path: <linux-arm-msm+bounces-99322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM/dNY5gwWmaSgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:47:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 736682F6EA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 16:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 777653211BF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB7A264614;
	Mon, 23 Mar 2026 15:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hLJzJ2mo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+4Ug3T/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1098E248883
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279052; cv=none; b=etIqHD8QG6l72ebYXyYN6IgFaren3WZaP2WYyXvzBrUBthlWfw75eF30WkEzBkImGahGVoEnUJIyfFCHFbip4Ins4f8lXYmoKyJXT1AmmqE4kr5yAdWDI2Rt1KHJSBq2+0EuLrs2pA5EzO5jfJCq1rYrsqZuBLokDoyQVjy2yZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279052; c=relaxed/simple;
	bh=ger4mNU2MAah45zM6NpYL8nqSB2Qy7tzko5/ZSj1Zrw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d9/466xD1cZGioBoxP7NCcw4m/vsOuFHcS/AbNMbXMRQyFQEWwy7FJbtZrOv746yRqO67GXS6BZPIg0jFs7Qbx5saX8rhuu60NKtaQXRNLPqw9uEIUc5ASrf0NZwmR2WYeYSiPgFt1nhiHQXq4xHXB8vgU95NIIh7dA1bJHkbbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hLJzJ2mo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+4Ug3T/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGbuB2829150
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=boUl6xUGZvv5vJNkbwAOVK
	NUiG4zdXWr1MeFDFuAI1k=; b=hLJzJ2momSIqGceOnnHJ1gqgvkGa5BLJ8qLJa0
	i4BWkAnWYpRUruNoE5IYD18r84J+Va6ViWz2Q7a3d5SshWtDb5Pm3avWn1XEx+x6
	iZHrLq65N2KAlIkXY7citVNJ1kn6nkjTJ89+4Hf9uGYOZmuqJU7IT4aAdv7eM3/e
	bpc7Xf4MZ58tCVugJuErwJc4WnfiXVcII8Sa2KMUdKu+aUlZTQtnZbz9cdUyioEX
	c8mFf4SmxYH1Td0oTXC22hsGMDPttEBkT1bxDgby5NB6dZBLiKkNGNLU2SPaZK2H
	3PQrfLKI+Ncl04B3VUGUVxx09vxcBm4cdx6NdwHtzffltqIQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r20jty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:17:29 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56a8c0b9ef9so232230e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279048; x=1774883848; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=boUl6xUGZvv5vJNkbwAOVKNUiG4zdXWr1MeFDFuAI1k=;
        b=C+4Ug3T/OUdeY3MPqAB+Ud7m6FhPZ6clzPFrCmoP/+ZHXlNXkKScCGAcnhT/Vhx7CJ
         IcMdVXzMIFmSgOt4ov+bWlQPIwf8X/rITxUGbvggD8VY/XDJyP4tjXAYQ+FmFaOOez2+
         ijM+sHlzvKDRuaKod6LsqwEPTBLzUT6hES67HXKsr/RwqMNdW9wCpmgTHgtPfv8GQ75m
         pQbFAdtzLWx5sNKRpf3A1lZn1w56ywTuTxGs3dK+/mg61w6NqpFjAefBo3aydX28KabR
         e4BVXvm2cox1Rt54OuBi30XA0DLX/gTpycroafyLYSLVl/zlS7ITp3VVDmyxKo5+CCTQ
         J3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279048; x=1774883848;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boUl6xUGZvv5vJNkbwAOVKNUiG4zdXWr1MeFDFuAI1k=;
        b=ZsFGeD6ct+Q+rwOYN+iaQAREHjMyBIrjmp42fGM4DBLO98wrWHuP3NPSxhhKeTr07T
         aa1cJsqir5t5xd6vVnHQGsjKoYEo0XqFWKLx8q2ntKv4VQFATNm58cR//yV6H8Ytr/y7
         PMv9z+bhCfqr0uMWDGbyfC3QuMjzK7k45XrRHqivv3qa0YoyTkH+/OEG0DtPo6Wg8p1k
         SPD137Yx6Vp4ErtV8xrzVXz49cy65aX+dlcXPPUzO5l7Mj++gsqEq88rO/xdZv7Sr+Et
         DmLUBYOWNi0LiaSm5u4UwWtJ1e3VQHD0vHsLu4YZ3O5KGWf6E1jtMfwmhPkixomCQpil
         XEuA==
X-Forwarded-Encrypted: i=1; AJvYcCW0r7dvWsYDhX5t5bWKaF/T3qIxAiYyyK0bcGRv9u0HANRC8k4ZF9nl1J7wy3L5E3CRfUqqN8EY9tekLlK9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qpfv/1AXDIff6HO+vXHeHfq1wXmPhWFSDi2WdVI41dy9xk4/
	25KdntxABmzhAJNdVNPVAkwMGf3dZGuIfmEyOLcTS35bE/dzuJI+A2sdzWNM7D3wKRON6KhWCy5
	0HhrlXc7DbelBw6mKYZnvtgI+dgaziLZZvigrE71jcXi81l2Agh7oFE1Zwmv5p30FgGfi
X-Gm-Gg: ATEYQzylmsoC0qlVxEutgHC1pv+1Hb3DMqeuwIk/N+t7grjqW9bG3zTc5+6+9TCxFSN
	UnpTwTZj5J0H9JgDtxKX9gboTJtSIzjgyXdbD0X3Lyym/4LQwXCP0iqSyUOY5O80Vhrq8+Z7djd
	MdCdzIlDvh0QcypLTqZ/9m1U3QrkmzuoXykqZWmW3QMeu1jZE7Hs97jfwg6ftxoNndcIh/otad/
	4JkaNlDEu3aqWiRaYdo48ziXipF/5Jrj+LG7kmOqHgI2OvjISlHpLSVw1a7UMZiYbOOwzaCJAFM
	yCPCpKWtllnia2dD3o8P9AWFJRgZ2ewgm5K9uqyfNPEHHTuVUzU/WjVxjZIkXRAPJa2r3LOASZH
	okA5lzQpp0geYCrfFQDCD6WOAPp6xoN+MjHg9rpsSIMuajI7LEAwU
X-Received: by 2002:a05:6122:e1ae:b0:56b:da56:b261 with SMTP id 71dfb90a1353d-56cde33f1f3mr5510011e0c.5.1774279048236;
        Mon, 23 Mar 2026 08:17:28 -0700 (PDT)
X-Received: by 2002:a05:6122:e1ae:b0:56b:da56:b261 with SMTP id 71dfb90a1353d-56cde33f1f3mr5509994e0c.5.1774279047655;
        Mon, 23 Mar 2026 08:17:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v14 00/12] crypto/dmaengine: qce: introduce BAM locking and
 use DMA for register I/O
Date: Mon, 23 Mar 2026 16:17:06 +0100
Message-Id: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJZwWkC/3XOzW7DIAwA4FepOI8ITH5gp77HtAMB0yI1oYUt2
 lTl3edWqxZp9GBLtuzPvrKCOWJhr7sry7jEEtNMhWxfdswd7XxAHj01GAjopBSKX1yaKCF3k+c
 ei8vcdWhGKQP2wjBaPGcM8euuvr1TfYzlI+Xv+5FF37oPrq9xi+aCo/PeWVAU/f4UZ5tTk/KB3
 bzFbAzQVcOQYWwXBhi1GQD+GVL8ISBNFZGClBAGbMcweOvbfSqluXzaEw1PDaVfSz6sXigBdUu
 SRY4MnR9bLeCZBRuLHqhaQJYyOqghQI9BPLPU1hrqliJLmF7j2Abt2pq1rusPQk3CnioCAAA=
X-Change-ID: 20251103-qcom-qce-cmd-descr-c5e9b11fe609
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9427;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ger4mNU2MAah45zM6NpYL8nqSB2Qy7tzko5/ZSj1Zrw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVl1/BLG4u96LfXnmrPgYQmC3YAXpMABtgvmV
 aLOz3nWSiiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZdQAKCRAFnS7L/zaE
 w2zdD/9mwjAM7FvXSM4mwE/n64G1Z+YMhsbOenHnxWu4xuaUd53FiHfHACIrWHiDT2uJS1u66kt
 Qar0zC7eKCZ02a0K5JocgRmknCgl3isB1KoPpsrGk+qoaR5+6IkLuDJ0jsN+0MT/5xr/TuNrPKE
 MzkzFNVA5XyTmyscqUhiMMABDYOpomvvuqJnorm5ZxJ9hO0z9VzxCt+z7gSHcKM2AmypCPBFJHB
 IEAGfW3R+xBao/uoEQYe40b1d8JCpHX34Dy2hvaYbiRF7bNWU4qQUtT8TkSOFDCX7We/lSbAH0K
 rhfiZoMnLUoVBVNHTznNbZRlrYj5uAPk9BZ4/iPpDcnby2zG57RyPsVWI2lUeu823w4+H+RnDrB
 5YHpVterie24Z/IDUhAotLJQwCAZjsBaIh2CwqiKJoMQuJJ0Acuy5sq6iaYNpy710d7JUAHNada
 y1JUaS8FV5UfLEP6U0eGKLvkqvb5Zemh3eIqAEWDswDV/XBE1/EJTJsrvRG75VQmGS0k4WXYGd4
 mH+59WdfUj6o9kuR+ESlimkUJdZEXWrtjoG4/12uNo2VppiA7oH7/5c6EQPVK7nBLfZ3/YbJA+U
 Bc6hF5WUY1bNixrQgy7OZL+g4P4cY2XQPdmG6NJEXLyc67J/rOZl5d+0MzsqvmD1FV4rsqmdLXr
 3J7lGDbqaBbZfCA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c15989 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=uGVhH4IIQU4n5J_wZqUA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fM8idMqs0oU6IH7oRqhY50TPlbIH2Djv
X-Proofpoint-ORIG-GUID: fM8idMqs0oU6IH7oRqhY50TPlbIH2Djv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfXxFTiuWJNuAjv
 LNC9f5fCqlGoBgFbc1JMeIaHZtU0xfD3DJCPaJ4Tu6owdEPvASUlsZ1GTIGtWSEzTMEkjA/p0f2
 4zNyeDetfN9YgkI0N9xyu9EFP9esUjqfm4ZaFaJeS+vTGT55My/c3kAKBIuBwzCjhLX56KZEvno
 3CLSsirfqWVZxD3KHvBsiRXJR69TINYooWwxCr+aSsekwIYnliutWMizORi1GTGG/Um4IcSrBvQ
 sFPZ1ChWKEEYOsPM0bUJ8ZcTDEq1+SKrx2Hs6NcFdDkoPfc8XPuBCMFlRfWvlONOUq3a7GigFw1
 7Qt6F0dXyK24Q6rQ511fVqfjVFBtut2H16986v0nClme5sWogeXkWrDzFo7haj53jyYrlJ25cmw
 py0wiGyJNJXzVthv1h9PmbC/eRJkDlqttE09MxHre2pSFslXVIcF8U8i+779CUdLqNbSm+Z/E+R
 a2L09YFf9EoGRusy44w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99322-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 736682F6EA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This iteration is quite similar to v12 but uses the BAM's NWD bit on
data descriptors as suggested by Stephan. To that end, there are some
more changes like reversing the order of command and data descriptors
queuedy by the QCE driver.

Currently the QCE crypto driver accesses the crypto engine registers
directly via CPU. Trust Zone may perform crypto operations simultaneously
resulting in a race condition. To remedy that, let's introduce support
for BAM locking/unlocking to the driver. The BAM driver will now wrap
any existing issued descriptor chains with additional descriptors
performing the locking when the client starts the transaction
(dmaengine_issue_pending()). The client wanting to profit from locking
needs to switch to performing register I/O over DMA and communicate the
address to which to perform the dummy writes via a call to
dmaengine_desc_attach_metadata().

In the specific case of the BAM DMA this translates to sending command
descriptors performing dummy writes with the relevant flags set. The BAM
will then lock all other pipes not related to the current pipe group, and
keep handling the current pipe only until it sees the the unlock bit.

In order for the locking to work correctly, we also need to switch to
using DMA for all register I/O.

On top of this, the series contains some additional tweaks and
refactoring.

The goal of this is not to improve the performance but to prepare the
driver for supporting decryption into secure buffers in the future.

Tested with tcrypt.ko, kcapi and cryptsetup.

Shout out to Daniel and Udit from Qualcomm for helping me out with some
DMA issues we encountered.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v14:
- Don't return an error to a client which wants to use locking on BAM
  that doesn't support it
- Add a comment describing the DMA descriptor metadata structure
- Fix memory leaks
- Remove leftovers from previous iterations
- Propagate errors from dma_cookie_assign() when setting up lock
  descriptors
- Link to v13: https://patch.msgid.link/20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com

Changes in v13:
- As part of the DMA changes in the QCE driver: reverse the order of
  queueing the descriptors in the QCE driver: queue command descriptors
  with all the register writes first, followed by all the data descriptors,
  this is in line with the recommandations from the BAM HPG
- Set the NWD (notify-when-done) bit (DMA_PREP_FENCE in dmaengine
  parlance) on the data descriptors to ensure that the UNLOCK descriptor
  will not be processed until after they have been processed by the
  engine. While technically the NWD bit is only needed on the final data
  descriptor, it's hard to tell which one *will* be the last from the
  driver's point-of-view and both the downstream driver as well as
  the Qualcomm TZ against which we want to synchronize sets NWD on every
  data descriptor,
- Revert to creating the LOCK/UNLOCK command descriptor pair in one
  place now that the NWD bit is in place,
- Link to v12: https://patch.msgid.link/20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com

Changes in v12:
- Wait until the transaction is done before queueing the UNLOCK command
  descriptor
- Use descriptor metadata for communicating the scratchpad address to
  the BAM driver
- To that end: reverse the order of the series (first BAM, then QCE) to
  maintain bisectability
- Unmap buffers used for dummy writes after the transaction
- Link to v11: https://patch.msgid.link/20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com

Changes in v11:
- Use new approach, not requiring the client to be involved in locking.
- Add a patch constifying dma_descriptor_metadata_ops
- Rebase on top of v7.0-rc1
- Link to v10: https://lore.kernel.org/r/20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com

Changes in v10:
- Move DESC_FLAG_(UN)LOCK BIT definitions from patch 2 to 3
- Add a patch constifying the dma engine metadata as the first in the
  series
- Use the VERSION register for dummy lock/unlock writes
- Link to v9: https://lore.kernel.org/r/20251128-qcom-qce-cmd-descr-v9-0-9a5f72b89722@linaro.org

Changes in v9:
- Drop the global, generic LOCK/UNLOCK flags and instead use DMA
  descriptor metadata ops to pass BAM-specific information from the QCE
  to the DMA engine
- Link to v8: https://lore.kernel.org/r/20251106-qcom-qce-cmd-descr-v8-0-ecddca23ca26@linaro.org

Changes in v8:
- Rework the command descriptor logic and drop a lot of unneeded code
- Use the physical address for BAM command descriptor access, not the
  mapped DMA address
- Fix the problems with iommu faults on newer platforms
- Generalize the LOCK/UNLOCK flags in dmaengine and reword the docs and
  commit messages
- Make the BAM locking logic stricter in the DMA engine driver
- Add some additional minor QCE driver refactoring changes to the series
- Lots of small reworks and tweaks to rebase on current mainline and fix
  previous issues
- Link to v7: https://lore.kernel.org/all/20250311-qce-cmd-descr-v7-0-db613f5d9c9f@linaro.org/

Changes in v7:
- remove unused code: writing to multiple registers was not used in v6,
  neither were the functions for reading registers over BAM DMA-
- remove
- don't read the SW_VERSION register needlessly in the BAM driver,
  instead: encode the information on whether the IP supports BAM locking
  in device match data
- shrink code where possible with logic modifications (for instance:
  change the implementation of qce_write() instead of replacing it
  everywhere with a new symbol)
- remove duplicated error messages
- rework commit messages
- a lot of shuffling code around for easier review and a more
  streamlined series
- Link to v6: https://lore.kernel.org/all/20250115103004.3350561-1-quic_mdalam@quicinc.com/

Changes in v6:
- change "BAM" to "DMA"
- Ensured this series is compilable with the current Linux-next tip of
  the tree (TOT).

Changes in v5:
- Added DMA_PREP_LOCK and DMA_PREP_UNLOCK flag support in separate patch
- Removed DMA_PREP_LOCK & DMA_PREP_UNLOCK flag
- Added FIELD_GET and GENMASK macro to extract major and minor version

Changes in v4:
- Added feature description and test hardware
  with test command
- Fixed patch version numbering
- Dropped dt-binding patch
- Dropped device tree changes
- Added BAM_SW_VERSION register read
- Handled the error path for the api dma_map_resource()
  in probe
- updated the commit messages for batter redability
- Squash the change where qce_bam_acquire_lock() and
  qce_bam_release_lock() api got introduce to the change where
  the lock/unlock flag get introced
- changed cover letter subject heading to
  "dmaengine: qcom: bam_dma: add cmd descriptor support"
- Added the very initial post for BAM lock/unlock patch link
  as v1 to track this feature

Changes in v3:
- https://lore.kernel.org/lkml/183d4f5e-e00a-8ef6-a589-f5704bc83d4a@quicinc.com/
- Addressed all the comments from v2
- Added the dt-binding
- Fix alignment issue
- Removed type casting from qce_write_reg_dma()
  and qce_read_reg_dma()
- Removed qce_bam_txn = dma->qce_bam_txn; line from
  qce_alloc_bam_txn() api and directly returning
  dma->qce_bam_txn

Changes in v2:
- https://lore.kernel.org/lkml/20231214114239.2635325-1-quic_mdalam@quicinc.com/
- Initial set of patches for cmd descriptor support
- Add client driver to use BAM lock/unlock feature
- Added register read/write via BAM in QCE Crypto driver
  to use BAM lock/unlock feature

---
Bartosz Golaszewski (12):
      dmaengine: constify struct dma_descriptor_metadata_ops
      dmaengine: qcom: bam_dma: convert tasklet to a BH workqueue
      dmaengine: qcom: bam_dma: Extend the driver's device match data
      dmaengine: qcom: bam_dma: Add pipe_lock_supported flag support
      dmaengine: qcom: bam_dma: add support for BAM locking
      crypto: qce - Include algapi.h in the core.h header
      crypto: qce - Remove unused ignore_buf
      crypto: qce - Simplify arguments of devm_qce_dma_request()
      crypto: qce - Use existing devres APIs in devm_qce_dma_request()
      crypto: qce - Map crypto memory for DMA
      crypto: qce - Add BAM DMA support for crypto register I/O
      crypto: qce - Communicate the base physical address to the dmaengine

 drivers/crypto/qce/aead.c        |   8 +-
 drivers/crypto/qce/common.c      |  20 ++--
 drivers/crypto/qce/core.c        |  28 ++++-
 drivers/crypto/qce/core.h        |  11 ++
 drivers/crypto/qce/dma.c         | 163 +++++++++++++++++++++++-----
 drivers/crypto/qce/dma.h         |  11 +-
 drivers/crypto/qce/sha.c         |   8 +-
 drivers/crypto/qce/skcipher.c    |   8 +-
 drivers/dma/qcom/bam_dma.c       | 228 ++++++++++++++++++++++++++++++++++-----
 drivers/dma/ti/k3-udma.c         |   2 +-
 drivers/dma/xilinx/xilinx_dma.c  |   2 +-
 include/linux/dma/qcom_bam_dma.h |  10 ++
 include/linux/dmaengine.h        |   2 +-
 13 files changed, 413 insertions(+), 88 deletions(-)
---
base-commit: 38fb1b38c3086065ace8fd72471c452cfdb61d36
change-id: 20251103-qcom-qce-cmd-descr-c5e9b11fe609

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


