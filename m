Return-Path: <linux-arm-msm+bounces-107870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PduI+YMB2oLrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:09:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EB054F199
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80055316EF96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDE4480327;
	Fri, 15 May 2026 11:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Km2GzmLu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/rLlpkf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD63480331
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845696; cv=none; b=n5Ea4WzXsJ/gpa9PnqRDemjakc+b6dV19VgKTTbAAeBbtdjnxlX20GLTNDaUgH963e4yICeXr2B2d0j+yJHNoymSpHw4yZlMzyF3fjT97e7BcbHHqYKZu4W3RiGdUy5p+DwTr3RwfmIPhCFQNc9G64kqBdUaCnqESoooqJm3vdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845696; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWstgp/SHaggPRtH+aL+dYWLqUzxBr8xZ6197KI++wm6BE27NogNVRn0LzyeEAd3Ut+jTO1qt19/OIdXyLSn/E/Pj8/G/Z99oliZa3pOjszSY6q6qqvJ3p12y+J1ydDy3VE0AIm3EMr6MdlDxEKRsat0If5H2fE03N390/y6m7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Km2GzmLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/rLlpkf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBK2HV3197594
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=Km2GzmLupUZxciT/
	3uy+vsBxHJpfUa8Txvx2jz1eZkOZSfu6ff6mIAX2Ljn6Rkg5jlE5JCaNkj9HNRxp
	vJ4tKIbmbmmZIiZsjEvMiqe/xp7NPFVOGj7upo2IxtKnwXsgwEVicg1VFcJ8pnOu
	a8WGCPsLeNOz29+NGPFRZJjZTWqJ1wOO+mcGlntWbD30bZM4P/AMHFDZYZcyliay
	rFlThivkXDCkSBogBSy7c0gGrsr6OtJ0zC9d5sAWibio2GV6uuBQf5VPiwTwBjcC
	pS8S0xWZUq4KnNtpA9Pg9Nr1Uk7idta9dn3BD54xQiF0AWAqP6OMI7+qItLRumYL
	sNWQzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qb3gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 11:48:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51494d74d4bso23692161cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 04:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845690; x=1779450490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=B/rLlpkf22XCrT/mTKnzPFB7uk48sJBp1vn500i3iMhdGBfuZxBcUi7asmDu7ksRn7
         tVZPdj8IFeal0cComOQS8ZrytO3s9/MSXqHe9IffSYSezb+GXe4sk8UL4EwpPJ7/t0MX
         lhoOAyEyWS5wdf6uE3x4ZyrSVFvx9JbnQ5qCJUMcGSsbqZikSpk8S7MSpU8RpvisEUdy
         JPpQnrLG97bZvxDF5kZS/xMdg27nJeMGlu3YokzA93Z/y42djsuVC8sDJ2iPUf+9MxYO
         Qnkq1wsUdliBRaNUa/mwjl5UVb0T9o7wAan9TdggKk81qMO0MSz4eXOc+c/3Kb1B7zzq
         htNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845690; x=1779450490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=mNsGcMpfbilaDQa0RHZ4CP+AAHV3R4Udv62wS/PcQoRclDm+3zArwbi/xcG4UELJwK
         WZGLfrjKIFG1+XqQBEHx4mlF+unhEgBwWz+dm9fAp/CInS4BdDdXCG2AOr66XF7RFlo0
         g0K2xXfFAN1jM0g919v5wjpvVzMof5q2au7RQdVbvmHhKVBMWiX2YThUfcRH3M6tcSaN
         mhfuewidgZAwIhklYEfbJ+ffjSHdolh4kdsTVVlSHC5d8vPIK1WDQ4//kWD6IJhhr6Dw
         +zUCdzAvnKppMqlg/l1NANmSBjGUsSEAgsATiFgkOqpSQAijNFizYW/g7Zi3dhSZJ4OD
         7A7w==
X-Forwarded-Encrypted: i=1; AFNElJ/HmLOqDNGvJKq1+djee2Vmk3H214aUY1srGv5T26o2M/D4CMXfsRbn6c+dv0bo32WUMAdIbhd5MTgvrjAe@vger.kernel.org
X-Gm-Message-State: AOJu0YzxHK7A4VUyR3qdXwIJQvBpisc/y6S7AKGU3QCPeQpYPP9P2FE4
	/Eodcd6eeO63bdSY9Fnybb3NqwuCmZnqq6Mqo7cHvpTTnxhiEb419vnHEPVDJ0OMRSiYxmhJ0w5
	7pcmis/72cj70ll2bGTOiZY3Qs5MP1LfbAji5qSTdPVxYr/sZqaaGeEv5h/wKKUFBqFM9
X-Gm-Gg: Acq92OGagwZfc64T9MWR0K//Y2Z30Lj145Jai3h+fgkfu25lgGzS4zRVhso1ZVGG/dW
	JgdFwlCOcYDM/3RaAENt5Muq0bS9D42fP65MAcRWbKPk9A8M643iLLtCHCxhnm95WNSnA2HFDyc
	KSbIxuH1z6petG7XVJwpFdDY37F5rbwaKvboQkyHEsOkFZ7mIMQWMj9BKS68ZZEv7dGQZWnofiF
	ALvCafbdxvITaj2q5AQQJ8P3yMVVwsKjWwTeMxmTqfmudpizp+0p06N/ep1wsedmbCRr4JcFqRh
	KL/hUbWew/1tcqZxDHuRRfYNzSoFEUZySCVVe0r48Kn0q0rIwHTWgpi4UAxhvPFyGziSTdqVHi+
	md03yKzXccTQ7wCEjoLIOtmOOzrU2bFZNLltT4eSrXb6IwxjZtvdEnL7W4/1Is6zUZ+90AIad2N
	ZAK7I6lEwR9pfsRszapUkShV6M4q8oHMJrCbokZJl1lxMjiA==
X-Received: by 2002:a05:622a:a950:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-5164155c029mr78223541cf.6.1778845690289;
        Fri, 15 May 2026 04:48:10 -0700 (PDT)
X-Received: by 2002:a05:622a:a950:b0:50e:18f9:b5e2 with SMTP id d75a77b69052e-5164155c029mr78223021cf.6.1778845689662;
        Fri, 15 May 2026 04:48:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:00 +0300
Subject: [PATCH v3 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-1-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf0ddAvQKZ7Qmp9e16WDcQP93Q3AoxnF/5Qu
 cuYRexvWlGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9AAKCRCLPIo+Aiko
 1ULQB/9YTt9SYYmINJ8B/XA+CM6rSmr1pxaqAU5Xm42zA4d5raA1RO7Jantz7vGgmpmRZtJqr06
 dbUdc5FvmqgkHNtbiS9l2S0COcqo6HMwHp9z0pD25acKlpIOyrimjuVyyNMD4tsLBAurhW7vkJF
 Atjt1uCqfqWokwRtoh32FSV+NSkCZ559XL/ng6RlfttzkfM3OGqvBGx/CQbZ3D5xMYwoTPqjlkm
 u3vmsdZH6tCUf4DOACVCy/rUAqH392NndlgyWYHV1EDLdc6tko8X8uftYzGbZ9Ty8IX5WKizxNx
 KvAcN6zJJ5OwSTTKakHFnBK1kOPm8hoQ/lp5rqgvResEWXTF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: s_aL4FZhfbpeJX3V4IwqxBbCPA3AoO7Z
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a0707fa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX/7DXtW9Q2bNl
 2OqWDD2lyBqeAh0ESqpefDK2CQULt3GfGISK+ImfVCqwifP9LUl4TqvB97uglBX6dwL5r0YaRnb
 0JpRanshjguwgP52WcMT7Pbt54ispQGFfCZahQqNvnVSEO7zxjicdNHW5Mtam1VEZAty9iq3VjI
 TTtwtp+L4oW5N+B447ft0PL2Gm2rHuOAyLcBOPGV4F0OIR31WY9Z4SEZUOegt6/TeMS/7JWef1h
 09FbTMIDRX6C4m2QrEPCow9WlERnI/5ifhgG1GCd5Lt/WKf7IsSqZwqhoo0bzllEMniug7LonJ5
 bIXmw4Lsm8lgJpUbybF26P/Nji7II5eVHPiPIeittbfV2+1GcrBJINewRu2yZpRIEAy6Ol2wb7A
 0MM5WNGudajRMIXg4k6JZakt39g2XaoU7YT0DZWvYiC3SWgo6GjmU+cFg1O2W1v45iNT/HgBV96
 qqh7Pn+5RCe7hcMZ/lg==
X-Proofpoint-ORIG-GUID: s_aL4FZhfbpeJX3V4IwqxBbCPA3AoO7Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119
X-Rspamd-Queue-Id: E4EB054F199
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107870-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3


