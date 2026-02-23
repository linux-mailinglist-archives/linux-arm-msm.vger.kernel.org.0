Return-Path: <linux-arm-msm+bounces-93750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CApRM5OXnGluJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:08:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5DE17B42A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79F213054CB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045BA33B96B;
	Mon, 23 Feb 2026 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYrDs6DN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etjOHkyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EF233B6F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870080; cv=none; b=dtjM0anD8qcQZqr6qhB+qULXhyUUXj25nOLcL8vXMGbhtM4qz9+VXeLQIOqZ2FUxP9NWDNPhUEmTFIj88ytuJqIxZ4g5Q7ePfNMjYlxpQBv4gIcbe4c4G1v0KGU6KjkKNIh17wh0VwKTy0q94Ury6vT3m4Dc8fZpRUn3Mm4meQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870080; c=relaxed/simple;
	bh=DFQzZINZtXFqVKS+d/H7Nq3BWvhDSfyQmYunncyvNfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Idp8Qqmni5Mtwr5szeRy6jIXr8qjKAyZsUY+EBLpRdh9xlOJvc1dzWN+Fraq39erndd2Ma2Sv2E9L2+R21oyW40s+OVrkMlyj851CaaUFoY36xM+RIOU8f9A+srbooUZ1b03CCutcj7i/KtTcRlmUs0ecBdXij/n4TiS4Kl5Y2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYrDs6DN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etjOHkyZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGFJO53936183
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TNBgtOWdzqa
	N0EAZI+bdR9OoxF9zijtL5mpQAoIQbzw=; b=aYrDs6DNFPNEoEJsTwHNDDk7mHt
	YTg5WGu6MEbBrB07Bcug4w/m1IhfiiHDnPUIamLCYKetrp3eipZamUvHobO2XLNL
	yLUo//y5yyw15TDdV3DoebJPikN0Y8lEnep2YG0j4+eHhVxYcjMdiGiUxZuHumw6
	9phgdA0Sq4OBtQX7ynwM7cY/rnZREtlkbTKpUhCzzTCLzJTOXQQE3Rb5KL/W557y
	9A83GYncnFTSEy70aWK3e5KHjvWQ/WxkPVf6L5ENcPEFvafH4tYdcyVtTlGXOw9P
	kzaI2809gKYmr5cBftaTQofpmQx1teRcQrXZIEoXzYnJlLDGJ+XHCBkDLEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mgchc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:07:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c882774f0dso4187349785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870078; x=1772474878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNBgtOWdzqaN0EAZI+bdR9OoxF9zijtL5mpQAoIQbzw=;
        b=etjOHkyZEkBNysLBkiaSMUGy1ULxxqy5u+BWXg31yUyrzFQlBCkKTXJsqMpwjYBEzl
         ol8EtuzS5R16Q/+Srio+lnRJhcfJ+YhaXFBzayYpo1xEMYVXHYvGjKNaDYkiV8YYrkiT
         5d7Ix7VBugG+VdK9AeFZMJPiWl3f289kCb1MKyseKS878prnv8z4hXi51RyaTG64jk2Y
         3qPgdBYuGpj4w5jxkgICGGAosRBMfafBLStqQOSZ0g5oQQfeeciToJxrexKpf4+5kab+
         KAuUbV981zd1pkqt8GFH8TU7OKHyb/LycLluTQ2unwbPyuS+bUnKPYx2fsi6BKl2QRzn
         Wuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870078; x=1772474878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TNBgtOWdzqaN0EAZI+bdR9OoxF9zijtL5mpQAoIQbzw=;
        b=AvMBl5D4Z+6ECyYISjeXlHbQguygDFVm0svhZs/le/THUmFAhJ2JBT2gTtdBvhutfD
         gH7+aNnBggWoENoQArUoOp2GUMdaHGz8RAbBtlcUv5HFnIs9dymBwHf0qrxX6qrjT/5G
         wn01p3Cfx8aNaYy6DPIKbhZn3y6emxMXDCTI33zW4KabrrOwgXV1YbePTxrE2nXQ6kZT
         T8wfFw4X6kMJOKQfXPuh3a0Ac2lTOsWXbTxlfTidrWLDOYgYxndyEMguJ4g+r0ZOZPuu
         yWkpLbBOiCCY4yVYbBM2MhfswurI3WlwOMReUkVRgwZ/e5JdOIKmwGWblb0ukdeOughq
         vEwg==
X-Forwarded-Encrypted: i=1; AJvYcCWMImt+4xF9zcC/Cj5m1Ae2TivtJm5C/zaI3sZuo6wvk8SrubN2wTFv44pkTeuKUKvsvWpxhbuvLIBov0Xp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhxq0rHqp1+Z0pTFLvljp8zZxeSyYFwHhdPGxgfqNUSjANqBWA
	ExBPNgbFgTx0hWncZbfgnQ2M+CnGWEPEYeK+1tK9JdZttEdbgfwaiim1AJbP8yDnnIGY/ElCWEW
	KeEmnbYlEUwveR83UfjpnrPtR+Y6BCGVGsYslutAb26xgg4HMI1fRQ4HwbNmbxE28V5ww
X-Gm-Gg: AZuq6aLOapSyDoxzCNu7NEnF32JGvoqIxFulpY4IQZ1idLtncE8c2LoUJkBSSEjm3bv
	Nkp20P174VGj8DNrekRqaeI2LoMMAcAja+pEeHELzh9JrnOhJZuD11JqcrDxcn0vkA1bVY7+lx+
	p4Sucfp2+W+wgYVXlWEajeTXj69gEyxYPWwkjt92/2dtscz3oReGkLQTltG8Q+MSGFFvy4zq2E6
	y6sMFs52ts1ISbFC9eQPktgrW2Bzj1Qbl1tduIdx/eKGyZuKVNb6vDrXTz/iKrUL90bINGVgPxn
	zMuc114VIa9uqQ/Duefn/adQHKpWsE6Ya0xXsCWRTHXT2sdz0N+AnXJGEYGjLjVR+Mz7qCCk1Dl
	572oeGextjEagwNfeIpJmCCjCRjzsWxUJWEO0+agKC1HFCg2KuC410OM=
X-Received: by 2002:a05:620a:191d:b0:8c6:a539:55d7 with SMTP id af79cd13be357-8cb8ca800d6mr1186629485a.55.1771870078220;
        Mon, 23 Feb 2026 10:07:58 -0800 (PST)
X-Received: by 2002:a05:620a:191d:b0:8c6:a539:55d7 with SMTP id af79cd13be357-8cb8ca800d6mr1186622485a.55.1771870077646;
        Mon, 23 Feb 2026 10:07:57 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:07:57 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 02/14] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Mon, 23 Feb 2026 18:07:28 +0000
Message-ID: <20260223180740.444311-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699c977e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=vtfATQNByG3yFndO7KsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: jT9q5x9rff_rMK_vV4AOosVjx4QCtAb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX7Yj2OoHPMguZ
 RMruohK5ZF5HL1qogwKZAm3eVG05W9r+eKtoTCGxM0b9Fgnm9Fzwy/ALxNcbsckmu1ffh8T7HCE
 RUkoMnXz720cU+IH+x548vuK4khiN57Xg4hRsgT3d/AtticsQt3SLAGy95oc3Ixad3KoCcyB020
 to8BFMR1+TiSryl3lS3X3VSjeZcDXIF7/GOv6oWcLd26VV5ot6oBu83WrKaWMhbaIMkPE5Zrshv
 uI2RlHQCdezahDjbjcztTBXZypGtxUasqoJUhp4F6iqDjo3H1BTOwVNSjlTkpB4WIZD/Hn9+NT+
 uTtHBaHdsHZer1PHoVvONhSqfzsoBHpy49X8rBAjL7eZnOeI5qEqSAtdziWqfYblg1sj6Tyiarm
 j5bBKalvit/hhI5I5QzQ2gtxhaCItsUaTQ5wDM3cNE7SdzQl13kQfrfjuZeMFuCG43cByOrumHq
 HzJv5umY45hoGvDZDjQ==
X-Proofpoint-GUID: jT9q5x9rff_rMK_vV4AOosVjx4QCtAb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93750-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4F5DE17B42A
X-Rspamd-Action: no action

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by using a manage version of of_platfom_populate.

With this change when the dsp is shutdown all the devices assocated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 9891e757165b..be8b205d42c4 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -752,7 +752,7 @@ static int apm_probe(gpr_device_t *gdev)
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	return devm_of_platform_populate(dev);
 }
 
 static void apm_remove(gpr_device_t *gdev)
-- 
2.47.3


