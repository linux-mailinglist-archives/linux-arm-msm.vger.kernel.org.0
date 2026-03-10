Return-Path: <linux-arm-msm+bounces-96607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEGTMJcAsGm0eQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:29:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B7B24AD09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 822823040B0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4472E388364;
	Tue, 10 Mar 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXC5niV/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwSLXJtD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58D83876A7
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141771; cv=none; b=FHpq/f3n9jqzc0JUjDhdh/R03F+9B7tC03Zr/1QoHXoWmeHQtf2H7Nj3h+LCe89RtBbwoaH2sb016C3DOVcN2S2BSv1kW1cxIrOmQET+5igG7mY1glzzfYvq2lQx/cFk737hQRqopTivmZB9bMqp9ShS8vwHzvQSzAkQR6RT7IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141771; c=relaxed/simple;
	bh=4kCGFUerd9XjwVun1nTUlYZGlcZap7SHC0pIvgPDfIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDQ5q0e9sYUBDLiKSn+jG9wqrOou3wVJ1FJ6dv/GbWJ2BcUeHN6F5Hd/rXnQd/Cs8oJIkx3RlWsDx5uR2ITRd+VjT3Yglvsbh9Z9IUkf50Ee/fhnoahj0sSigOB9pbPCwiO3uleuJUh6v2ywhwZLNeYTHgSd65RQEQ0D0FFXW0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXC5niV/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwSLXJtD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wJbB3124459
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=; b=OXC5niV/J3he/RXV
	HBpr+nDe8/aemQ6+BeRrlf6BTUhi4MbRlVL+gBPWo27/X9tFluI9FqmHL7mPKE4o
	QzY9Xkbb/ZZXBpBnn1bYiEvPn1v87+aiP0rNiRGYdB6MeAwYwa0i0BBG+FXky8E2
	1XO6IYq9lwiKR4ucnNjiXu+/bnpBs7J9/BKn4s6v9B6ngMWo2xZD0FBjynyCChYi
	nGycch2+hmCt8a4PSTN4KrdJM5Cn3imNMfIgWfhPOvYvJM3ovG+Pa3YPu6BL+j90
	vBr65LbveEQwJ1qEqtdXJTnaGL96ziMc1GFm7/CONJmAx1UxJ/k8VGQRNtTY+4QT
	JF09fw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0tp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:22:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so832592785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141768; x=1773746568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=;
        b=JwSLXJtD/zhzT7dBJn6DJ7xFlwhuXr15lE2YGDO4K0nD9qVf/QhWimCnphy8RZwILE
         vZm9N9FCOmJkHVPSp5YcZo8Nq8QTQYLBPQJEYJyn0BdN5YWMXbYNnh1ZRrb4IaT64u0M
         Jgdo4TCQoB/XzYm6KG0y2GEU0IpwlfRszzIGR9vO/WhaBYtcI9JGe6n37txb499bJ2B2
         xRgv0apIn7d/QNM9CCCwzIR31hVYT9Ex4+Bg7954e21wIDROJeqNz5hf3gdmDk/6ACow
         gBpMZ5jLR5SPl3PMQbyMrn8NfqKMY4je0wLaVsDpDeBaE4XPY7aiu9NQfmnbr0/LDRUn
         j+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141768; x=1773746568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=;
        b=AixPHZzKScWDhkqUyay7hT/CFNErtXRtn+6ZYbhp+WNOyun4KU0JRI/HcpTFf9eY8A
         SEO/E63LW6+LbbCKjM9KbEyu5q3q4ub2w7VjXv8eJEzqag0+9ypqNxZ05polKsw810OE
         bgZoUqjyzxJpD5hkuodnNPq3ChEfjcqtmtki/xebN6p2ZQTF5ayjih5FpksA4CYTXLbK
         OlUHY8Xe/H5LgR/+8w0BTSBnVM62CId5whR94JBdSwjv2hKTjtz5BZ6etkhh4HKoDTF8
         BQCkUIW907NkLJ7TbiHd4UJUc6UcNjzVTloskI+BwheVWuKtvjNjvF/S+2VPgjquikNj
         yyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd5gnOAM3alxwy6uGH8Tb0SUi+OwKJE8uQ2DF8k7Eqf2ZNJSfUIMbD42vHJfZkv50FmkT6EgZ4c1AEhs+k@vger.kernel.org
X-Gm-Message-State: AOJu0YwjaX8Ic2zp1dy53C5hGjOlUBNkgctjqMz3qiRZvfzDDhBMtKha
	8HdsTlW4qmwefAtATXV7Ix2wH/ve7gKtCVSzjHU9KRp81nAT+FeP7c9E7XDq6wKWovXvKhaLVJ0
	USaGXikuYKTK2jjxInDtu+F0+PLV9/i+KLcSt1VySmltM/V2YJ5GGjxJU0Bmp5X2rH3Oo
X-Gm-Gg: ATEYQzxt4efHQ5Q4CCExvDoi9DB11quaF5a5B2r7ab0cXMCnGvF1RHOlIzFiTjN+6tT
	WvHsRcVH/dthBzPHLQ8Ly6XYG/D6MNie68MsZBTaNXrzXMRsHXveivj1t7zb8HeQT+zYh/C9anj
	HAM6sft3XNLwRKRyLX2NNvmFVXpCNPU/sBX/8MevecgGawCqiVHEXVeV5r+gsxC1Z8yo9k4XWeg
	+MGTJOsmU5Ik6lEautVXdheFK0C/3FuPV+UWp757wAJTNYOLEWBknEHsDSr2NSAioYf888YeVyZ
	aodsHhK64lf+rUXRThpgVZIMhDQLS0U4gBxdIdd+2J7uwiRcoMVHMzKk+3K56QCYOygD+ij1Hif
	Cf19rLxHn6sVis/E8v9efZnuGswxIb4FDNjnq9dMsEOD7
X-Received: by 2002:a05:620a:6c0d:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cd93b5aa5fmr298330885a.10.1773141768243;
        Tue, 10 Mar 2026 04:22:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cd93b5aa5fmr298328485a.10.1773141767852;
        Tue, 10 Mar 2026 04:22:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:35 +0100
Subject: [PATCH v2 1/5] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4kCGFUerd9XjwVun1nTUlYZGlcZap7SHC0pIvgPDfIc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/7+Tx0V/XsD3XPBcWawLv/UH+qV9b41Eo9mZ
 PhOc+cPamCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/gAKCRDBN2bmhouD
 17siEACHdzjRE+5UXVUKCQjtmsjXeQ1XmAMVe185ibjnPxGTUlZVM7o6brVwHHjW5yQlxXVhnE9
 OiEkttDjUGuvEOi3/umPRm/llumQaTLU7hYxz72No2AU0ED+Dra5FJ2C54Uk3BL7ADo9RaGezym
 Dat5knmeLz+H/9HwFjkHVHS1qJwa29wO/X3O3eMBRaagrF/UTZm9zyU8+LVQOWkYDg9wezZWy/y
 uCrOBXO9Bk03hDhoWqnXO8IxB5dmgazfpQjflf0TgE874HJG7CnqMcHC998DsEtytNTLjByOW2n
 zo/3UDqiGLTbo5tLK0NU+dbbaAc+yXcF6uQ4IVh/T9Ox+CugW1eLlJWSU0wiPBEOwuQSyt/J0yh
 XoFLHbdnwJ4ShgTKT8qKV0VRZAsifHzQTtHT0IJWEqaxarseoCA/JZjEjVewt0/oaIiMmwaBGev
 c6s+HtAvQafDzV9b/w215PsFPi+NLjNqWZiRxcFKJJg2SodeJBjdDTnjQvjC04VuRdu7t8q+go4
 H2AdknxoAgj+yomEIbt25lm9IazxGEr33WRfKSjwR9gBiFUBBleKgpl4Fsuhf63WBAbgekWdtHm
 7wPD5hlMrxKgl/MeBE4iz7oJigEgFmEmwEWEnQ/cNPE3iq3tuUX34v/RNn2diRcHHFolSvLtOib
 9luiHafINMvBsOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69afff08 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LhV2E6QuAWs7UOi9dWqLBsAaECjr2F7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX3euC12fGQB7U
 v9/izxHR2eDDKIHM5KiXxo0FOGfNIA/SpTiUhizIyH7sKMtIFC35TfBsdhAbcoTT+S/yA0tEk6a
 L/oOz9R/gPFor2/58IdXcaPJW6uDXatnqYWvqEk3gOW31hSaCsVQcLsXvdueMqIiIcycoKUO8hC
 ZQstBOIL6sGR6Ybk5c6z+nrvulFGZPEdyToxlF6F8uzPxufnwhTBJo+K7obaNZM7+cSE7TxmqZc
 Us62Rj+fClIMBPTyjf0nvsGt9OUYPFFfDifk9IYk06D4rDMKuH6/QUVGN/o4d+uUrT79aEXJ073
 45T1OOQ+9VPPs/O3lXjNqY2yeIofF8xWH+jYAD4IFyxb5WE6vMaLfiIc579pAXfG0tmFDrjQt+D
 5YLn39IPAQZaJfEazBoMMMTi5XGw8l6Ix4xbo0WDBy7bH4lfok2tFxRV3hw94AobiMp8p4XRM+Z
 7CHFvLeuXqjM+qh4yCQ==
X-Proofpoint-ORIG-GUID: LhV2E6QuAWs7UOi9dWqLBsAaECjr2F7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-Rspamd-Queue-Id: C4B7B24AD09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96607-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,collabora.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 7a37e273b3af..ee2f1121411f 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
  *
  * Return: 0 if sending data successfully, -error on error.
  **/
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait)
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 344ff41c22c7..4070537d6542 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -58,7 +58,7 @@ int scp_ipi_register(struct mtk_scp *scp, u32 id, scp_ipi_handler_t handler,
 		     void *priv);
 void scp_ipi_unregister(struct mtk_scp *scp, u32 id);
 
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait);
 
 unsigned int scp_get_vdec_hw_capa(struct mtk_scp *scp);

-- 
2.51.0


