Return-Path: <linux-arm-msm+bounces-109561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOOaGBztE2pCHgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:33:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7405C67AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC3543038169
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7F939B497;
	Mon, 25 May 2026 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9j36+9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XVdHQNr3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C496839A800
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690594; cv=none; b=l4nOqQyEqW6dmdTGYmYVm3e1w7Hcw5pFFTZ1LAr2tgw41k91rLmgws8O9qVN/tEeVqR/6+zRxxwAnMA6GywW9vvsTtzptRevWEQglwstH9VK+fIaMzEf3ZdMfVQq0yrScHSWrgUYJhG5JYDqYGUGJJvQctbceSrbLKWNaHwCKRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690594; c=relaxed/simple;
	bh=klTowYgdEB8buioRr0OOUIRkEziBDxYFkoD80S8wUVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hrIhPiAYGtmyUsVIFnLA45qCyMIxx2wrTo1uGYwS5ctL4tRBT+oCjX2kRkjFTLK2d10oNversVVh0B9bLEpuAECXuVcrINiP4aAunmhP//dIWzZN5ugbZ77cSd4GXzjqnxCkyF8J74v6JgWh8Rf+mmeDYGdl7FRKMP9E9dYiZ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9j36+9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XVdHQNr3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P5amSi311737
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1ARXZPf9Z4FYIOd8kvk9TD
	SdnkIZZ1l99kqXftbEF0E=; b=R9j36+9uCmvnVbWrKVQdqQp1FTz+pBexRQEeKn
	eheu8VZtNryBIXwpizfEplb76q2I4VohrUWakXMXd3lnDtxgOt+sOOKgqCkGWRSZ
	DPD/MLO2i7OoXt1xUQt0PvhStU54VAswo/YX9AOlNNxxSPeSlsRkWNRhLebI/egi
	l0klkXuBQFLmPQ7L9icQUQBeVzTdWRD2/T+fahfo76WKlyKjoRBPkZcqU7+JeEvY
	Sl8TwrRQWWB+MKyjq1p7lGR+SMxQRdzhoCrDZE/OqRjtxqJP7TqY//J9lSRCCPyo
	N78NWW2AMfRxnHJXY+gWM5oa0UAqnKWj0o9lNpqN8Ic1248A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb1kmnn0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:29:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304448ab58cso1745965eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 23:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690591; x=1780295391; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ARXZPf9Z4FYIOd8kvk9TDSdnkIZZ1l99kqXftbEF0E=;
        b=XVdHQNr3SXIJQQ2f3U/LyYmQttT9LpQzEINnkp3kuzH3OgD1jalW0of3foRQ6dGgoR
         jMBHu6/ztcl+kGMpcS7tV0rf0uRJgVn8jVR9L066BCjONT/wuxphD9Ey5exQ3NvOWjp7
         8pCbV1KLiOcjZHed6VYxEydqPGL9ThyvY+9oZ8n/i7j7trU53i8KRzBxq0gE8ozSnR/C
         XvfygDW3XunY3cYNtXEcJVJCIXqMlivbeQm+AuWlPp4O8hTNq+cI05nEHeCvRggo2FBW
         snVgr5yOwgcX3VSUHSu3P8yaGcIHTGxfPy0EY4MPRskvnM7n1I8O2MgGIuDiQQGZ0LmM
         gqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690591; x=1780295391;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ARXZPf9Z4FYIOd8kvk9TDSdnkIZZ1l99kqXftbEF0E=;
        b=bQmvt7G0FnhGFggMfZdpTEzFmjFxpPFtiYDIhf+KOg0FONbXwROPjX96AO3sX4bPYF
         FzLXdhNDF5LPfTzFjE6vGbYHV3mlD8jfTrvo8eJD2WtjCu0D3ATAL2LYg4sATBDF+b1h
         wzObzoGC0VL25DmUz7shEFMWRGQMIenjfPVVCrlPFLG6bOrMJIYDSQsU1ZFR/mqSGp2O
         oNKlEImTbY6EkyBiCBCsuyWBJ/1vzTS0QZvUv9CL6GHpXN6Mjr7ij3Gvo0z7qh8JUvP4
         joMyOTVfia1hmR6IwdWg2O+O3o75+cid6g6BDlZIFK+Sh0Owj+yB8Pn1KhYWakINOcae
         M4AA==
X-Forwarded-Encrypted: i=1; AFNElJ+y7mV2qo1BBj2Jzk53LhKAuF7J4RQUMX+yx99UqeWyid9xn+8BhprDTwoJmx/HA8/FG1WX1kyy+zXmpWgM@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpf5pIY3r5K2vZmzlSNLOMf0l0GR25wQKUD8vknQ866hc38s2z
	bdOT+w74zUPzhABnMkzRY23O+deEs+KfPvZOhkiAyhcrh6gM2OoCcvv0sYoLInNOzm2eox0nlcz
	6pYGKt50jp59YZQg4yzhc7weNswwgOoznVA74a/hs8TGzSzj2yxEMPXvNs+s0550F4ajy
X-Gm-Gg: Acq92OF59YeKQHm/intfbE2OtabyliVDMDbC0Dq6TmVhtf6EbWs0qvDzG0tGcEJuhWa
	Lyk9wdRgQ5DPbwAqd7FFlGUMOE5LpkAm7/5TzsModvlh+2PAEaS5lf6fbJ7g5IMsNA6/d94G90/
	ibJ9ac50i5DdxBspj43uWYSzOdRUzoKqulyAyNDl4l03ptR81sm5SjvUtlA5WqG6LxhDrsaYat+
	3gjhu3Jqv2V3jRl6oBO4MhAWNfaWcYZzwI8JXVgzbJssx3qX7GF3MhM9UjZ5DCLf6+wLRGVZwZ5
	67m20OBo1VCuOB/hEt25p5/R0lJcoB5qSe8XXdk58rCeLQaaPwpwYumvVPiwP7wx7AM7+m1UzPK
	OZQyrOs2WuUvoFHJ79E8Umg2K2/LpQZodaQzmWSMlr+tKRS+yoa/bJTplwNmo7yyADY5Dbri7
X-Received: by 2002:a05:693c:3b0c:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-30449037990mr5765657eec.4.1779690590725;
        Sun, 24 May 2026 23:29:50 -0700 (PDT)
X-Received: by 2002:a05:693c:3b0c:b0:2f2:8857:17f6 with SMTP id 5a478bee46e88-30449037990mr5765647eec.4.1779690590138;
        Sun, 24 May 2026 23:29:50 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045223103bsm6918036eec.16.2026.05.24.23.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:29:49 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/3] dt-bindings: soc: qcom: Add Maili soc related bindings
Date: Sun, 24 May 2026 23:29:43 -0700
Message-Id: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfsE2oC/x3MQQqDQAxA0atI1g3YoFV6FekiM0YNtFEmIIJ49
 6ZdvsX/J7gUFYdndUKRXV1XC9xvFeSFbRbUMQxU06NuqcEP61vR14xJbVSbkZio76YsbddDdFu
 RSY//c3iFE7tgKmx5+Z3iQnBdXy4Rbml6AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690588; l=820;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=klTowYgdEB8buioRr0OOUIRkEziBDxYFkoD80S8wUVs=;
 b=nnVieUCb28brOhQUhccFjy+iyGTjKrAwLx3Je1+L9F59032UMMSfwQHyLxpuw/q2yuI6kR/oV
 Y+iaKaeTDt8BjTr+UqN90Z/Ab7GkfvnOkZ8TDzNNwAcouaZVu4j7+a5
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MiBTYWx0ZWRfXzOd3AmyuvWKX
 358AQylEwdklveGqVsyyrXbB+wUbcN8u3D0bZMH4P+RO1z4E6PXm9YhscvfI2eiBy59D3oHm9KH
 7LmfziuA6BAFmamdV3FhrwLg8KvgbvmvM6PMuo+BuJ5u6eBcS1CFtAmZ9owkhhre99jdLV+Q6VI
 a8fzDIs28yZN9lTJmwn66vr9mjOP3hqRJh4YOuz2IBpQgyCB+PrY+JyzezSmMw5xz6eEjtMYUAI
 FWr0siOl8QfGwPgbq8HW/YGN0RPYOMdzYD7/bk9ARUYYjRobLPZxh3SVojaclLs4gsX0zyEFHa8
 NnltshtQuI5Vik8JcOz35uJyeXONBy9urClPFlBVo2pG6XlK+E/gDXNDAobTHYR/7h/X7FcZML6
 l8XNUl66b6L24v43P9J682AnmaQdeJpCW5pQLQD3UTA8lUgFW1fdmePaLQzSBcI551nEMUfjHyS
 w0uibYOfCPjnf9GIr0Q==
X-Proofpoint-ORIG-GUID: 59Dgf8LFV1uN-owFB3amYKM7kk3KfWYm
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a13ec5f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OwyURWB_y1r3m6W9eiUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 59Dgf8LFV1uN-owFB3amYKM7kk3KfWYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250062
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109561-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD7405C67AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add soc related bindings for Kaanapali Platform including aoss_qmp,
imem and SCM.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Chunkai Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel

Jingyi Wang (2):
      dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
      dt-bindings: sram: Document qcom,maili-imem compatible

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml      | 2 ++
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 Documentation/devicetree/bindings/sram/sram.yaml              | 1 +
 3 files changed, 4 insertions(+)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260524-maili-soc-binding-2a2287fce578

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


