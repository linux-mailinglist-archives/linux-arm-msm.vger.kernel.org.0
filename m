Return-Path: <linux-arm-msm+bounces-104660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK3zGcYp72lE8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:17:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027A46FB96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DBD93008247
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1FF3B2FF7;
	Mon, 27 Apr 2026 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtJe9AdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BFnjTGYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8373B3C1C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281380; cv=none; b=TDS9Da4Qf6P9FLaFCUNyEpp2HIzwxLv+cnFeLOmanKTp5EPRTa6jtTc0iMtE+Iu2t0dQaG91Ltk9xiT4LFNOjbay94GlMQw7LHZCsE0yufE5TVmTV0FC+TmOPjBJxkM/RxCEF25AJuEHxhSUn/9QRKDs2C0QgLgRj+OuyDdcM+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281380; c=relaxed/simple;
	bh=0l3gdVnkPeEhRWmaFMSjmRRcTqey535uYCWAXzuHtwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aMmqg8B0IsXptaTrtLh5ACi8vsT6BNFN+6/1mg7WaTWQm4RwI8lCtkWVUysvCDS82V9xkbJfxjYWDwEVPugZlYDWsBqKcyfdjUw56HOfvWXUb22IZNXDLNy7LFNxUIkaCOI+zW19b8IZXfo7rt5x2hw6eWPL0U/2WC76ME4tEuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtJe9AdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BFnjTGYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TMJM3682002
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=gtJe9AdT9HkSr3Js
	x38JeDnFSfFGOdRNOe9+KEzBWFWrmSCTwmi8hAmj/tDuBmlPa8+s+Uag8VjhObGC
	gZhKmcTh+K7bWHbYKAQciZS0kiwnqrVK2uCWF99tCQ/5KLLSPz2MU4kEyCMzekTV
	poy5FOVYLjPaKcLjJibfjF5MgB1Nt91FwrMa1WUeJOIQGcIVm+2nRB8Amo854ERp
	exzBk1gxO7lMyb2AwWrXao/IQx39OFt2gCyYGWSCd2UTSHEAwcYTExvVJZ34qp6C
	rtWWVfBUpY3KcN1n5bG4H3xAl9A9fBw/KlnQF4lYTfz9wksveS/IYMjXelxJkbPL
	vnP+6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgwaeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ff051e189so35381941cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281378; x=1777886178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=BFnjTGYbcZ2dxQ6AYvFPgB+QwucO1LPM8FtNdISCofiyV0GIECiasWxpoa3nfZTK/m
         ZgWOFCXHjSbrkNCh2PRmUQ0LuKJb5z/+khIhEpvDihtDJ31PgtyieGf3fvE5H1o4awk0
         1avcJNxvnXbO7QdEX/QDiI/vn6SeW25Ij4bYO7NcuAfJFtFWPqBFmmhg13cMguVtIgab
         qkpSzllZMPrk0k5eK11/c7apYSwo8WUrGNIJ3RJV3JWJQvUQ6u5AybacQsBhl+/3WxUA
         gjeoFkzSrcVJdkPyTn68A5y/LQPb3viVsh69EdEbYJLAtw14kQUM2xN5CWr0nBWenM+X
         Ehaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281378; x=1777886178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=C1a4L+g3fdAgj5OQpqxPOPSh3UBC7p4sKBhAvnb5d+PXxFJjkq69L99h9Ta+98lj7R
         pUymEUzT+C/rTchHDYQCahp8LbSXILZOUPiU8umpxfMxOMjiHs+LLjaO4FYHEeIjSpb1
         8XtaOuEKlasswEg6jgPJlMoKqAwkvtO1c9yBxW6OqFok+yM/EN7v5DAzgk5qjprF/a+s
         Lz0ipkHB4LEfYMAgKveW8aZai0uilgWbnAEzxdzCd0c8GTN3e69BoVMsc4e8uxYLQoxz
         qYrK2DdB5ddIlk84PQw+XXadkX7vRytQ+MPRk7TLsidS6ZGmz6xqBL2SmJbNPHVndYcP
         tuhg==
X-Forwarded-Encrypted: i=1; AFNElJ+4AZeav5ylFmAB0UrvM7dWe5pZeW33fQv+KAiiHSYvHe/d+0ywP6JFamAO23YZbir/hqDTqIX/IBfM1jtf@vger.kernel.org
X-Gm-Message-State: AOJu0YwhilKg9D5FgF0G2BMkWLNPMrSJuSwYFRXf4/aEZZNQh5u9/AB2
	B/WB5zeOCbAJJGI6H37/QISFmlCoXuoY+AQwkFLyOBYmGdtuIzTn9hvsrhSeZUGkMwVQELtEUoI
	jFAibNnH00C5hXHsH5BR7kQ/2aarK9Ivnk6VknBM7tDTiHmxX+m7EZSJNkmsFG0A0oG+L
X-Gm-Gg: AeBDietnDTyGTiGook8r8J99gGVwnLm62sLA9hA9tMuNV+bXngMbaNyBOp7pg6MSbT3
	o4Z3J/gsX4jAOsB5X7RxxoRZVPJDUChoHX0HLd8Y4LVLnEUEA4Qws9fVYBNSychkHyg9mm1JwQi
	kizgcw7/A+PmBDNrsr5mcV+G8M9DW9q0WfdQu9WQBBh5AEql1XexqIKUzP4Xoq5HzRpYSUR8GJ6
	upPCZrHdKI4z13/OCjuk64V7WFjz3DLjqF8SLaJJo2p5oivzkghZlsibM4aWfijhYvzBCY1fpIT
	xx7lrNoqDEvfS78BBdaNiY8iCG5eFwlzb7j5A42Q4BrNHQ0dizFeTNB4cYAnqz8Nsep58QZD7+i
	W6WaGJZHpE2N2UwykVOLTYPCZwuG8b3dtuNdmGr2/r+ctiq7sg3Thx9jSbYm4ew==
X-Received: by 2002:a05:622a:1884:b0:50d:a644:69b1 with SMTP id d75a77b69052e-50e36ba3f1fmr568019211cf.25.1777281377950;
        Mon, 27 Apr 2026 02:16:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1884:b0:50d:a644:69b1 with SMTP id d75a77b69052e-50e36ba3f1fmr568019031cf.25.1777281377465;
        Mon, 27 Apr 2026 02:16:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:42 +0200
Subject: [PATCH v16 09/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-9-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylFm7c2nvUtUcJ1z2g6SDoZs/iXQQpQZYP/8
 O+2w8pXe2SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pRQAKCRAFnS7L/zaE
 w0/VD/9baMWDsWkK4NNPbwXnJZguEM2WlDqh5cmEYnMjDW61exw0L221i9YQuxz1FKvSUWB0EXK
 wQZwEczyHis1Ia2k06kvA/lZuUEchbz3qTWQ/lAtk47GtvcvBYl2kFP0ID20FCiSWdNcCGBi2J/
 ilU57jELOOXlzvvmdRZMs3z80vOhTiAyEm7K2zOfbQYopsSb6rd5CGEH7yC4Qy9/7Oga9Mx3cg6
 DAnmBG7pvPKXqq6pJ9OLDJesW3VGWU1r6AGomCIwb6vuT7GRc9fqrkgNDKlfFYh/bBwe5fQI+Ed
 MWV7YAliHyiSA8Sw3O4BTJcUEJBFaBHMTUKyIWy5IZAhXx78RIXWb8r/gf0y2ftoNZqQrjaedEh
 RQayfnx57jEmVr8wBWzN6EEEsBlvvicQ4bmWTb+bX/7KTDrkZ8vB7egEW2Ld/gBB1TGmyFiVezD
 t+CQJf4GyIZmKytis6NvzgKF8R2391RbGCzvQ9RAjdFEUYgMwn5myMfiGAHv1n/uyCk1g4zY9P2
 pv2Wl3qrMSXCX+SKgAqQL1GR+fsP/+xuAIpHw0xb8oaLosSzVaa62s/dP3VHXIQnq6PO33f2qkT
 hXstzncGxDS4N9RodeFwFH8ytChyAtYXC3SKDjjHhQB6D/F20SA2U1cId6UPc1FOPzLhFETzdQN
 ivbkjKgwa0BeqSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fFUsFyOE5CJ-4QKxZ7HBo7Bi-L5PdLgy
X-Proofpoint-ORIG-GUID: fFUsFyOE5CJ-4QKxZ7HBo7Bi-L5PdLgy
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ef2962 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfXzpVnhxzACLLn
 rrjY7yh6zfFEyWk54nuZVtTAHJsg9Eq+JsLCc3TlkrBwiNg2nE5V31JTFk4B1PAPoEgfO/jj7MQ
 4e5QmUgfKkHa0yuDDP5GPbN52HxqXekMi8gKWouMhioPRn0sZgPf0OW3AxsS+73iAJEP2v8msUm
 5qUdvNi47MNGXnA6l5fewKUQDyfMXa57jqEuS7fjP29Lt1ovrlH+eQ8CwbuLIaTV9sKENNoU9Fo
 S4GwCgze7dfx7J46r6LKM7Yv8UjbfHevMU4oRmDHknDJBUsS22jItALVJRIu1OQekYV0DK/qRbu
 spWdyHlBokUS6zZxT30EtGG42m55SFqctvy69WdPl6wAIr1nku5GaYQJ4dxNbM8mcwr9s+LW/GI
 C8pmE+9OOLafyAUc6SmuV0nDgvaLzLbB6Dp9o//fRB08l8P+mU9TbzwF4aiGvccVoojo+jGhNG5
 N4HiBRsYmE3iuUVGu1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270098
X-Rspamd-Queue-Id: 1027A46FB96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104660-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..a46264735bb895b6199969e83391383ccbbacc5f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3


