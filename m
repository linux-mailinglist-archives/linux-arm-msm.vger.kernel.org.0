Return-Path: <linux-arm-msm+bounces-119038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tP4IOi83Vmpg1gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:18:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C888754FCB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:18:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a4LgA73n;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=X54DeTnR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119038-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119038-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB29932B9F29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 13:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0D64478E3A;
	Tue, 14 Jul 2026 13:06:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7850C472786
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034386; cv=none; b=deTqVi122Fs2utOUOY3xUaCM0wTq1+b6swvfoTt/DS2kBG3uimZOYDNddejZZGmYPgdI5bVCQozb1AB5RQ5CBuBd6IpHc2mhxAWi3MYL2APzOQqKhBQY3W6ra11QI8nStC9Pf8tpxpf43/Nd8zAwSHX7a+5VFzKeqY2Gn/xuH40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034386; c=relaxed/simple;
	bh=ad8q6nsg5XR5gFJZLjmNhpkUUdvZwCTtsA9xX/W7JQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQ2kccGlZ8RqR6FE2zU4liH8S5OVwdUe0nbbm7Ghhgn9Hq2hENji7DERfKmabAUAO873SaSCQQHfpGZ3/frU/vhQ+ArrOHPR6/EOma3oifix64FL9ldFChbqpt6QYvGfvaRWeDAvPg7RacLpHuLLpU8HcjoUSIYDvRkrK1Dz8xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a4LgA73n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X54DeTnR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO9Fv378754
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nGInOmivzMPVkLPseyHlX6e4mIIRapTk96h9wvj3+ls=; b=a4LgA73nIGAuIWPi
	ob4zAkQV+/BARVUdLY8xducV22J2f2xzhuDKPzDOi+LFtwEryM4WgpIrmnYgH3xN
	beXUaFeyCJ5ZDk+o5wxBG+McB4UVC3K8UekCQj1wJiptLgMbR1vPflDQMiUiuN9+
	JlEggb79vYCpniYmdKRBedtGLWx4IpC3tJsqlF5OXrcYZ4mCBHr4pmrLZ8PFFPaB
	Jb/KPrh/WCNraholqtmhP/b6rlEgAOBt/JKAC3DNByRo5tXfmJyaQ/QGV5mK3CnE
	HISyXYtViFEMKBL1T+6oENCx9k2+yKq6plFzRn+9Xpcdum5WMzhb/tyHI+LKOIh7
	Dl35YQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4ackr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 13:06:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso10975711cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034384; x=1784639184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGInOmivzMPVkLPseyHlX6e4mIIRapTk96h9wvj3+ls=;
        b=X54DeTnRkt6zN0kU6lQzfLXHj+3JrYdMRBvcgUvmj4Y8QriGVTRopDFRihmHaWd/Qp
         hUZ+SiXn57GEvUUXX/R4GNoXfMEhlZHj2QxqwtsdulARN2o0XNnRyPDD88pQ64Ff/LCp
         IkYjw9bmZNWKUhciRv9IS4EGBgSzzvh7JJeNLAhMkz++bDEg4IDnmJxvJ5SK1kOcB1tc
         CzDSDgCLGsogwaC0RTP/oDLyDRYIYCefFoboqYykt9Iizxy6QytEQjjak0PeWy0jyuw0
         xrDDVA7RAHRzwJrvXxO6Q58rUEAkXjFpellFqbmZlSAGpk9LekgnQ+6MPXR5mLi3QC35
         sbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034384; x=1784639184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGInOmivzMPVkLPseyHlX6e4mIIRapTk96h9wvj3+ls=;
        b=Eha2jumTVSpW/gV6Gojx5YKrNO7OGb20IlU7izJGcB9hTmwID/VwiCchBXReVY71SH
         FZybBLXUmBXjAVhGf7KGWjoL6kLfoF+eSqWijK2fyUGilWZT+qqAEFWPkqiflR79VmJf
         2pG0zgfjJ8xr59afwTqiIZrJAtV7LNmwvHLqVEGa3Md2vSKTTMCuob0hf9QTqXZs6bcw
         M96rUoRpMh/7UNeJLIM37k+Pu4BV7DsOQwzj0jUwZGOrc7GAT+6+uc6t2s3jXfNnPFw2
         wtxkaiqHUGEkYFpJOWcJ4U3uRGJbZx5gmWW/Hn4OTDtK9Xeg/2RiP770ZU4hEscA0xXa
         5pLw==
X-Gm-Message-State: AOJu0YwA9SVgVCRtf4HZEl2Qiq7POEgRchK0yDAYIUgiGgdnQ+tqomvN
	v/15wNzl3OagJm6GVA952MzNtYyPXayYjHVuv00/asK2VFpDJEAioprkJuhHAy8NkVJVQXRFblo
	QwM7U0Gs5xYCvZGL64Je3fMF+hrsm70OmQUjfvEvW42bGTCD1Uotup8/NAGzxm4xRiFRx
X-Gm-Gg: AfdE7cl0cvlz6al8so2OHsV8DjHDLdo5h0PuxquouDrLgSu9GGK0pwGl9cIGeHIxCor
	qY1+Df2NmVDUNh55fkWUvM1zO+faIcFQ0sSqNeNp2gQXvZtxaUc6OcUb8RH71lfJf9yKXyX/0gw
	UwjUOotW3DySwcGTNJAE2jkDTT0xUaqNta6lKb2LF7ifGTmIWU69XEsFR57ECn6yAvsGURomeRD
	gCcl0KnlJEBYyzdidUROnSxHzk1/vhuB7O8v+EV+fXB6ezvzikgcWSaZ+56pA0XIjaOnXqpVWzI
	nxSsJ+PzIY5xQTdJup3PNyJXUYI3QAs2YzdnAzNxVZL9qQ5+m1wJBcXX/DupunBxsNF7HnQO6n2
	fcKeIoii42SPWjpo=
X-Received: by 2002:ac8:5f84:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51caa0899b2mr173880351cf.10.1784034383659;
        Tue, 14 Jul 2026 06:06:23 -0700 (PDT)
X-Received: by 2002:ac8:5f84:0:b0:50e:474a:47e1 with SMTP id d75a77b69052e-51caa0899b2mr173879201cf.10.1784034382249;
        Tue, 14 Jul 2026 06:06:22 -0700 (PDT)
Received: from hackbox.lan ([5.12.73.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f47688f29sm6323742f8f.21.2026.07.14.06.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 06:06:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:06:08 +0300
Subject: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the CDSP remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-dts-qcom-eliza-add-cdsp-v1-1-525e757a23b0@oss.qualcomm.com>
References: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
In-Reply-To: <20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ad8q6nsg5XR5gFJZLjmNhpkUUdvZwCTtsA9xX/W7JQM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqVjRG7R7bXfNncWPOW/Ai9ezQ3B+s3QvIisRQP
 yXPI1We4LmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCalY0RgAKCRAbX0TJAJUV
 VtzOD/9AecuqS0ePHiqLCmIjAgQq2ukJqKUreuL+u8H/A1ux+nQQL7OSJysHmKXKJ//rFpQJn5m
 LeTRoMXhDQByJux7IfndVhxuwngK2bRs1FrXil8ZffFjr9gGr6CkLM7wGrJgJU0qVy0WVIJfg+O
 YXJ7N9IHNVOVkJX3Jje8gouBfrLjyZ5R+sqGP0NPhC9ARZFTO2tJPW/biG6xikeTZcJXB9dp8LC
 6pDY1ghXO2ceoZwE18tQjXYRl56mS0HGZ1p4FuRX/OVyuCuEnsbpgDN9QrKsJslPNmdx5F+6l+w
 hS8Ev77pCy++qn32HkfJcpzyfm4SI+hWYdBOg+wJSlOucbE+TcYo7sOjoqt/Ic8zJmSp5uahTEs
 rAQUJER8zpWO7WRCuAfeIec09WaxJMuDrIbTyg2EXwVjqPISTErJJ7ec1NiU/uK3OOUVur69jDK
 IokVb4ls5Q3WhIuake/cd36dvb2qNCb9ygltcllt0BvdlcDEWo9Z2J2Es2PAVuOdIEflJUSGybf
 iyX07Ouk6sU3OcqT5vp3w7k1KNvK2LGC/LYSg4u+v3J8qIyai4mw1I8oq2NoUi5rcqH0o+eO+1j
 C8QQGfAHZBA1B5Zj0jSH/4m+HD789WiKjIRBGUwyYBV/qUXf7tjuasux8a8sCxeNHXCei23HpHp
 UJRQiBt3autN0JA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: OWt_X10qANJcVwNmTnIQA9a3fRdsKViY
X-Proofpoint-ORIG-GUID: OWt_X10qANJcVwNmTnIQA9a3fRdsKViY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX8kDCPtjywTIH
 wsxh2+rHN7KNuNKTQw4IxZ9/tW1+aDPQWfHxjDy8GlK7r2JOufSzXrB1XtIsISXarE7qqotEeNg
 M+UFED0GBlofimORfpeGnJ/0uJdeVmR/oBY5Vz5W5wflV1QTKoQnGJvboNg0CQez4hcWd+Osk7E
 7iuKzTaXUlCGXtcBWTk+QgdMQ/vjbEsgi3LZTAyugbWnzSN6w390F7JvvXG201cKjXhpFGbiklo
 xVZ9G7uAraG9sQZ8ZNv+Lv3FIhWsy1pEWyL9hVVUbN7qXLdtJPPMysMg3liBbBZe7rwi5cgayJa
 lj45PUubgLKIdgZnc1jlgaoTm2z9drPikqJJY8Q5qaPPXLdcF7zg+i4oz8BE2Hi0hm5AZaT5H87
 HL0ge9agmMZWFDgKPIdqF6oA7Z9EZjWnZK52voh1zqG44xNXBjDROiUbQMpLfosSkgqyvPOvkOW
 nfGyxNUlRA9WLfvP4Pg==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a563450 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qUYP/O48JsHWwiZSxXr1NQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ka7fFnpjcXfis0az0GAA:9 a=S8MOZktbxV5DdIae:21
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNiBTYWx0ZWRfX7a8bhX8V8g+5
 hIXqagRFekjoh5rMVg035Q3QgBqebFHEsLbK3erYCFrXhCX2HlSppk+mHKZspBMi3HMBYHFhh6S
 1RqggCPwpXAFKYlK4u6yN1Zwl/iAhd8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119038-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C888754FCB

Describe the CDSP remoteproc along with the related SMP2P.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..0c6fdfc5a4cc 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -626,6 +626,30 @@ smp2p_adsp_in: slave-kernel {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_CDSP
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		smp2p_cdsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_cdsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 
@@ -3737,6 +3761,46 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		remoteproc_cdsp: remoteproc@32300000 {
+			compatible = "qcom,eliza-cdsp-pas";
+			reg = <0x0 0x32300000 0x0 0x10000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_NSP>;
+			power-domain-names = "cx",
+					     "mx",
+					     "nsp";
+
+			interconnects = <&nsp_noc MASTER_CDSP_PROC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+			memory-region = <&cdsp_mem>, <&q6_cdsp_dtb_mem>, <&global_sync_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0


