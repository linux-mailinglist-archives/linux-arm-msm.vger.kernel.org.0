Return-Path: <linux-arm-msm+bounces-118027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JraZLG6pT2ogmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:00:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1110731E76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:00:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YJrYdGpt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dkvte+lO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118027-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118027-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C34B30C3E4F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C08F379EF7;
	Thu,  9 Jul 2026 13:42:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FC73254A5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:42:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604569; cv=none; b=MebQY1M4RfOo18fs1l0gaxVmbwgviILpJLqHAxXTYpAeQZk/BX+Cy5YlgSfPX82C8VULztuX67NuJjF57Omu3+h2HZVPB+0XF76xRlGIwGEym8IWSn65HQRFwW7g27EAIWIY17i7qLG6U3zh3v1XtE37rLYec83eaolVzvds6QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604569; c=relaxed/simple;
	bh=vGRslm2JgjUZbf39BdYytwE3+eFrdcsP+klQMQGIL58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GJTNEzFI+4iIUP3k73NNtZ9LCBpws0qpePmlEC1VoFExkULZQJuSuGeQEGRlQ3Azn/8N8LIagom1cOVp22sSAlOS9Ab2dxC0rPaTEmxRKJWxqHW3B1TEi2HBdxrhg2XAjKns5JmMxd71cA3jDSGulccw0/cMyPCt4c7oUvhSArg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJrYdGpt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dkvte+lO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNDni1450534
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IogRU0EgGYzYk36Cve7sEfmgGtlaDVqbv2PiTmYhJM0=; b=YJrYdGptpldFAZpU
	ju99QwaPUtKDdzT1YP8ZayZpbVzxIQ4VREv8Uj7vG0ZawTMC0YA8a4X1SyEKIHP/
	izaEvkiPEl2Y6oUMOifqh0Ec/FIjUB0CQWXJW/Ln0BliC6SxgnYD2GfgrwhBe1W4
	bk0nqhdOUI9yhA9UxpAqNIzOPs6k79LFh/bI+bsHcCOWoeulyFU1H9bbbX7v8Yba
	c+INB8Yai6EtXqQ3zIXyc3T38D4g97WH0zr4H8Hbuj1mdmysSAqj419xggHByox5
	4JWVXcOZxhBv08gT01vIVWOZ7hzDtvczkRdfZv7Zc8jCu6VTDSnzgqqFwDrzcA0/
	zW+kCg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vj7s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:42:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-745031889b5so268741137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604565; x=1784209365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IogRU0EgGYzYk36Cve7sEfmgGtlaDVqbv2PiTmYhJM0=;
        b=dkvte+lOI5xZOue1mJvKYKjgmw6NuC8WQ4OlqFmLUqPRBVFKWNBD+fI/iwi+nFGG9O
         0DWG7HltsdtPTSud4CH1XS53708WhIhlPgcSkaoeZhv+ghUEB43Btge/T/cE4MQX7Qx3
         /yK4H95hBnA/l5W/zRcIO27hkDGjGlgnK/QW8bnZrYcjwHdX+vYa2uAPOpzbmHjZXKLL
         xe1ApJN9yoAbqoNZgZJ+1QwtfIpxZQXbgj5YGy5/mshCz2honpa/o14BDYkazVCYYsk3
         MQln30gaXv8Pzbd+ze1LlhhJmfrhxY1tDmF7ULS4x8a9IfUkDqkO+QfR2FxBwKseFMn8
         t+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604565; x=1784209365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IogRU0EgGYzYk36Cve7sEfmgGtlaDVqbv2PiTmYhJM0=;
        b=SCLiE1HW734VuXbrfZ5U8Z2sSdnuFFDcldkgwFxYEe26Y4Qt9zltLO0GWl2tdFJYv2
         5ZgiGAnH4SDRYD4834LkBNukCKuETC01h+raldycuEFaGfW+wBd8AoqudXM5PTgA7QN8
         Ae8eNHkS97lVfZ7G5xaRxdoPeJYl6tbbc/FSxXckeot6DswCIsGIwmYGgdIu9it/7cix
         gto1/mpbRGJcwrBGqrMe7l4P26KKUmcCVU/0zu1FDvorln/0L+FLmKDsBdb2phvuBYOL
         hzXa0wAT+Q1Db6iw9PKqYzCUcIxb0+IjDDPKJ1BUjJ0hf3nOpq3uLhi+p+90hwxcbJ8I
         VMWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoedeohngG1owBaBIhqZhIGpHgMX7nhydhPfehMJl/1d/Mjb0g9xp7koVwhTNfUmCw04wIrAOTibLqEEwHw@vger.kernel.org
X-Gm-Message-State: AOJu0YwclhKOl5J8UxoI0b7HHPCFU/u+bNwlcbOyAtR4ZOFfdD66mZRt
	LpXVLJykikDxBza+j59CgHD2Awjjz7FMyHrbQgCqR2rXZ+P36rWV585iQ8urmGPrR3F3G4jfU0N
	VR+41AxtGGjCiDIA/4cK7GSlzeu6dTMgwFIrcb4Z9knGN1R1YtD62nIdX1Xy8LhIhxI8V
X-Gm-Gg: AfdE7ckVNUf8VDq/GbZP6TlNys8uyiXllYl+iNdi6SsPMdx/Xj9JZArfLyG8lYfpYfT
	0GpjRTmigQJyYpGATDj6//gDax49BeXLIQ8UGHXSBuE9ctbtx9Qm6FHbWk7vlXJmASWALJ6HCxO
	2XXhwfdcxRKT935dT2tlUTGhVmE3tucGla0ION0duFBv5xFqbHNh6wSFy2CK2Y9u8I/EYx7fUb4
	yxwFgo0IRWDt/eSt1aT6uMTd0OEZ1t9g/YWhURgNNGXKPA/CXSfnRyJmXZEGXpaZ1x4pKnCruWH
	s7KRs8Z+LumQ7NgNV3Z0t1LNi8072VHYgJDP1Ui9yAVaQ70Y6auCzUcjSeIRnSgonQebUT2Zk+4
	3TMx8U3CcsHzLY0qhu9DYTPgxbjzlGbSrbP7jjb+kpNvsB4ol+dOW4c3WaIjAdD5fwNmAbbFJmr
	0CEQUQYss8jtzxfG07I9W0JhXT
X-Received: by 2002:a05:6102:2c19:b0:744:d5f9:ffb8 with SMTP id ada2fe7eead31-744e00118e0mr4766133137.15.1783604564512;
        Thu, 09 Jul 2026 06:42:44 -0700 (PDT)
X-Received: by 2002:a05:6102:2c19:b0:744:d5f9:ffb8 with SMTP id ada2fe7eead31-744e00118e0mr4766105137.15.1783604563942;
        Thu, 09 Jul 2026 06:42:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:09 +0300
Subject: [PATCH v7 18/18] media: iris: constify inst_fw_cap_sm8250_dec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-18-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vGRslm2JgjUZbf39BdYytwE3+eFrdcsP+klQMQGIL58=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UmB5NqTeXRW4/wP0Bu1FZUxYKub0Fzca7ks
 xPmpEqoAL2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJgAKCRCLPIo+Aiko
 1S4nCACHTiwv67zy6iTfDqljEo9jqUZbwCmKGWM8F8T0LdMmuOsVfkC8mdCxZa7MkcHw1kSDTSx
 rgn1efgWwLvWHmfLDxrBNIoYk52llZDbhXYpfQrUokPVTKlQFD5Q5leU5Mf9Crg8mJCG8uf2a4r
 I59ptWPWlcdUXf2EaDZrOgaBAadCuN6d7fd6PswZkAF+fgSjq2jGcHrx9u+yy+GqpF2octfcsZP
 yDv7CRjbbwXWfGyM+KqhJDvUg4e2po5X+qH9ZxghLtur4JOjfb81za1Dv/DnwHCrf6TZy+WXbVK
 78ikTqHJqoPK41EYf4rSuQ0ad9NSFKYqtoa4VkYhGqLz5iHW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX6QEQ2WzfU8NQ
 e2lo33p4k+ytjvqmxWDfhWPiSLTIZP+5T8QqlLCEdxMdAMtck6mKXL84/4AtqruZabSYfCeWLBO
 rEQq3RGTfI9oIYSpVj+pNQyD5LvkXJUjzzkoYeLOPwUxPkGnZHJpfvC0NCuj0VZBigBpFj2BlzV
 N/dFKdwfCiozzKWMO971Jc3ew9t8hpMBjk0Lzv7EGPei7kZMky12EAMmmSipfDgRGmW6HmwIeqm
 lWZgPIZ9ujFI48H/HLh/ymY/VF6tmWf0og1qLobhryfHFPmIZB+GW+cSNoiKHrG4TOj4X+UKBwS
 sTEXlyyXBVcRnMhi45t/ZpOkMWzls5CMrtLlXdOgw35SBQL9GAsiuCd9xjajCwuvPrVwLlpQfYg
 y9ooC4L/mEfCuDZdM2HvGBEtFXLVAzbJ9s82B5wSQDvqgbx3xK2W3cQvWQn/fnTU7NXWkjZ5+mF
 +ZXNFiMBzAPdEUnX64w==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4fa555 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX9gBJZhkx0k5f
 3+3FcOnVCTwKnRg4ct3tSTiGEP9rwnBLFmgEnbBXHcpszPOO2FK1KY9EkxnQhf5gFav0LuvqFDa
 fFvfoPsHmJx6Vg0auId86bg/hliRT2k=
X-Proofpoint-ORIG-GUID: g7so5tHU4cL48zLUXuY11uux8taUUOTz
X-Proofpoint-GUID: g7so5tHU4cL48zLUXuY11uux8taUUOTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118027-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1110731E76

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 60bc1339ddd4..4f205757647a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3


