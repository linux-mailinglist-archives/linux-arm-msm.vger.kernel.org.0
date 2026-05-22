Return-Path: <linux-arm-msm+bounces-109334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLCyC2ppEGqgXAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:34:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5985B636B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 16:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6D616313560F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDAE44D022;
	Fri, 22 May 2026 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCK2lo5U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDmjaUIO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A4244D693
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457243; cv=none; b=hV2zvRfvlyslD0YtJdW+vaS8HY0YNxMJV67Pj1D7U7HiQBIR5qAZRoDdj5sXl6lcQ43CeAnHy0MHc8DX9JqjXT583f1qebjVaq2bDgwmNedQ8Me4qc4NH9lSm733rvz4//psbDR9ZmvxM8KQjhtz2ji0Ntyd8QseMIza2HFHTso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457243; c=relaxed/simple;
	bh=51qllpaj+ejQVsDQ4eqpW9Xup6eGEgdlD/8rDBDvfEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jv3+HC8IJ7zjgehSlOzTXPQDZ0hn/zmMVN73jD5hfJEjh18MDU/s+DIO1F+Kzj5bow0bMNuseDt5xUkdyoGHcnkJC4FCj5ki0x/gQEKfo0zJinmDVVsESKy/DA1DM0r0fdm1WuNPMnVe5p+3qARHwS3FGEguJMFKLZt6sES7QiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCK2lo5U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDmjaUIO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBZUn31297958
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=; b=iCK2lo5Uo3mqAHZO
	VjRFrMm5+qbBrs0UkiF+o3YL6Ebf/gyIzitwZvAQYYU7XdeJiP7RHwrJi3K+Hk0D
	4KVUMlQcNHJzglET8AKstFTGWMTJavA5JSkhLin+QMKpHwCcm0VTfnvy0r/WNggI
	vqraSPu2nfcokeSERfDRWDvzmurz7uYEFL+uWa+HdaEKz5hmHKs8nJS7hS92zld/
	TkgEogR4LX6P2seaxavVSAMDU9R57BiEJkx7wVSKpcs9dcAeG2hyPTBh3fxHS8PO
	9rhV9HRtbUCsg+TU75lR4szhBaoBe5cg3RiosN9fmglZvA6X1YjNPDMrCSsDI6AI
	jODnwQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0b5rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d53eeb8aso22716311cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457238; x=1780062038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=;
        b=fDmjaUIOKoFolidp2kJIxXWurfXrs/VU0zz0/+37DtglHMxAZRQE6gI1rkvV4/eCNx
         Ul1NMDP1zvh5iW95iJrUopMLLD5RlhPeuBhPXzepWtqRwOG8RV7qdtkN8Iwy0rivBhzT
         c0JJ/e4NevVeU7rG3iaUIj7ehQMfHN5uvnqVGiGRafmoe9HcP7DRWmycKFgl9ux1btPu
         eErFE06iRJWGnaSYXiFxuMYl1cOtFCc6XUuhpWYIvU/Djg09wtzR5RwOb7Z2GtxWi0xq
         vPzoeRwCE1VC/POS+zQwe+vlgtlyuQWSTM7UxbjZW6DXDXx7AflP1vooskYIVn60mgbG
         2B/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457238; x=1780062038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=;
        b=oJR9b0kOAE5uInTD/XWg0Fs1rFyhNKoP1JHzDsI4ATrlwoCzYCYLpJcdO+JF+lphlo
         Xs2zlBOuzok+alYrEfqL8vP33EMTCc6vjTNTv9PCIy7Tw7NXTb1vJzE3wf9NRKtY4dVY
         sgeCQheYcj/1VYUKL0NnwxBQ3EhvBaVXn+4W2QnUF/KQi2EBakYGZyNLF46BUxlWM1Rb
         I72N9DJDXPJ2O6qI8FpWsP4VThH3b+vZR0KYQHqFzDLoIWxIpEnS16/kf3tlIwmbVYeS
         2ybi+hOyz0feEfxplXRYn4s6n6DUrGVfMhy55Gm6ocDshFoyl1DtfKriZVRkdEgiba73
         GaNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DSX/Jg4xQA9NwblgcbPn1x7XW3t5mgBM8PRQEHh8o38Xs4v7x423bmCeS1qN9P2L4+LirjB554PxfQx0f@vger.kernel.org
X-Gm-Message-State: AOJu0YzJSuoLJr5q7e8e9l43E7CmvRG5sgghcTLcKhqulrLttIvW9h/q
	5Pcx4HLx6FH31Z2yJ3jRL2fgmeY+ucVhrdyH22zbdVNvRQni7+Ig2b8l1XaFjlnzNii5hvv3n5H
	haAeKDDDsqsShUMJGLAnCEv9XLpdk4kCJxS8rPWsEz0S4/tIlrhDY+VAh/VMzMZVEAJk4
X-Gm-Gg: Acq92OHFi2yySXl6FsB9bTwrlxaUYxIrb52pYCfj0Avh++l4sozapgUthat4VcirvqN
	QMhTEvgBiL0pb3FzcKiiW3gJNfDKer3nQ26dv0GTP16TLJ9IDGuik/jSsKX5SZzzjyX8uAWeJC6
	muhfczEy46kwuMw3o0Gp/1Aq9LwSNj8jehTJij2/qDSOEzYbrnS0w0ib1+v7t25ev3XBKlLCcwY
	k4HKLBRmaBeYDSjbI9DBGqIOSQKUTYjrRu5SfJYqdTmGBf6n/ylubhQ9V53zVAktlLXIZdJqcyW
	TVi/tobhiA/DLzXQk7xRLbltWuef0ZL7+h0C3xq1BgpmmyiVvTRM4kwcfpGCC0+bgJTWJXPhDpb
	8T2JAKgGWk4hiQZ17z2+ZVge2UZcBRRYQUBf7sGV5UNVbQvap7QborOEXOx6+
X-Received: by 2002:a05:622a:189d:b0:50e:5cea:a519 with SMTP id d75a77b69052e-516d443c718mr51205821cf.12.1779457237829;
        Fri, 22 May 2026 06:40:37 -0700 (PDT)
X-Received: by 2002:a05:622a:189d:b0:50e:5cea:a519 with SMTP id d75a77b69052e-516d443c718mr51205201cf.12.1779457237308;
        Fri, 22 May 2026 06:40:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:02 +0200
Subject: [PATCH v18 09/14] crypto: qce - Remove unused ignore_buf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-9-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
 bh=n0Cml8iSZ+MTejAlSL1Cpzw3FwIEirUqeMzFyFiqzq8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy73t7RClzY0R/8YYWO+mVaNF6zAcKbAxXTd
 /hKSx01csiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcuwAKCRAFnS7L/zaE
 wy9LEACDslImbuzNtup9YTuGUbBN7OVti7fpeZJRpKp5U0Y/I732k4RzXG9MFik0daokMSHkKhh
 jA8/uBpQ1ntj7c0AIGuiRMcFXAuqhUPc3uy69Z601sB2qpGfUBuOkioiX16C7JJ7BFngTomc3Bd
 sLmHH5i51inclmd/MvnjOALcpYlgftfEzjcU0OKfhxEA/ygadb2n5bnUd7A+bcJ7MJ6Utl23iQn
 231ZOxR007HN4BtOIUV/ctZI2Xwl7ZL8AFzKdoKHPsIV23gcKZwFWVtrOmQRlHzgVZ2qmnwtw68
 5ftTEg5MpYChmociSl0hS4Xj1ivgkr4Sl6CmlZ3CuSHk9V/sJup+BcsnkS+o9ADfGAl/sLJ4Ovl
 d9D5vd0HQ5WpjeeNMVJ7c06FwzKxjV497x2qE3Spzf6i6enrhVAyADdmv1P71betrLbWQ18vhly
 kUDE7Zl+fxuIQxGf1ArInMCnAE/J5pwOYYkRsmnNG17NQGSyEWEMRtc+VYtYS88sUGqOBV5iXk8
 IGkkIG3u6a38/SkyPO4RLZfnSogs3mFanSvNg+xGHouz7jwljuskcEiw9/sRNHapfgHM1Igdb9h
 hKZ6Tvcsw3FeouwBa4yq79p5fdgJNuCI5L/Br66ncxgUIDxwrEq2sL3XEdisBOLsUSDhDwTeAWe
 dL4mK/25ipWnEvQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX+JcfUJIUKfE7
 ZLOGJVwjst2A3zE9OOS0XFEUYUlfXPmOIIMaUKIGIQQKKIjtZXfFLwsMOEwRY8FqCG8SyY31A5J
 jnNqr0bqop6vTOfgrLeerQgDZJpPT9xGfvWGn45WxQ4mnLDNRpfwfoGkOmMD0Dk5wH7sNt9OFRO
 GrKG7FMDVgBgYpL29YFSDyrUwsY78LL7FiRPaY0gF/ikBPuDWK8CIEJVOPd/aB/vgAq+vUyfvgF
 LqLzbFdLUULm04LuqViq6ZLN5fLg3zjRIjObp4NeVwnMSd+mvUcidT5FijRHxKELygua49ZcXcl
 b3gBDTTC22f2N8b63lXFY88GXzdbCfRDsewwidMkF+/oj+O1BgyTpBGLTpBSc3HdmoTSgo0DDjz
 Ael47E1ZSgZZQ13sreiTvJ3OiMWf6tv3PFsVoQokNDjd5DSkkahlAxvvMmVcaukZ2HHSNRDfGfk
 NKc7zM3tUOc7kCw5adw==
X-Proofpoint-GUID: ly8xVRuGWTyprwn_I598_GZzogoxUJHK
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a105cd6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ly8xVRuGWTyprwn_I598_GZzogoxUJHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109334-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D5985B636B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
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


