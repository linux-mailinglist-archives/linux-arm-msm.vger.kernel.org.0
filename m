Return-Path: <linux-arm-msm+bounces-114171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sB++K2NmOmpU8AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:56:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C33E6B66D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:56:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GFpMNnsc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xv7Vq4Ai;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114171-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114171-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D9E530BB042
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15EA43D0BE7;
	Tue, 23 Jun 2026 10:54:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED183D1718
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212090; cv=none; b=NolaaF0ffAQmT6HcSNZqxhNab/3/EAQdbHDY1dhIE8dS7aD+SFAn6RcVh3YfouUp3HdzralfruIEPLHq9cJ1kDRaDtWZ9+3FaXnr9r//pX2yYFINXMzm/NfT9pRfwt+tneuqXpGh9YTyWOhtChAI+DjoD9egMWtG4PbWipcXLEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212090; c=relaxed/simple;
	bh=VbFUEQ9DMBQd3nId7u9wGiI/I3xbIkiPGekb/pHPPSk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BO6VgviDmuc1qTVGzS7efFDO28zW77SI308N6CiXTx/7tfkW/Uhl17WbxpVaNScR5kOAUBAEXaMVC0EEydShflzp4QjEKQEf7xYJy8NZc2DhTRjN32GzypC7kUBBfsnJguVTCyu67/EbDTh37ldzCJpxamgHMBczG3YX46+QENE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GFpMNnsc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xv7Vq4Ai; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAslVF4152385
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWcWdfbqWjmo3Hmirb/T4Zsz8/hT0nBX3ivX4r/x8OI=; b=GFpMNnsciqAxY5Jc
	3U+xg9yhLgRx7AF33mipe7GyPTQF89WIuBx2xT6NIav6Bt8TkjL7j/VsNcXXaCzs
	vI0J8rMAPo1mRjoQKIN65AUsw1B3XQBkxGiQt6ezi5bYzXHz1CEFIktPyq40nRRz
	nfqSujD4ysc0rNA2aUX6VpMQ9vcfkdE+Gf5DylRIxcUg7SixHtZcJ4C19c205A6s
	qpv7goUHHwSXoNIO2JN91brxW6hT9QEusNxuvblhEac51ryza5IHylsmc059knzA
	OZAjlYp9BrK3dC3wZp4EowDGNZHMkS4KbC50bM3Aaz1D0W8jH8yob/ZYXW5aYctB
	F2Wvrg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n44deh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:54:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0a99db8dfso43810775ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212082; x=1782816882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWcWdfbqWjmo3Hmirb/T4Zsz8/hT0nBX3ivX4r/x8OI=;
        b=Xv7Vq4AiYe95TlL0ch76m+8vbgTPFHTq8GctuCE43I8N6STrZ8rLxDUswuViJAq0ic
         +7hfhBCPQfxBcPltPP4sL8atXew+WIz7QTeuu2TggsWw41h/W+uWYYT6CHh+TQ28H2bN
         KQuaUcFGw5NhB/baF63LHufrZaWxMuqwxFBwATawvjQSM1mMuVgqPzyazB/TtjvUALdW
         eFiZb+rKL1xamakDkHfXHhewEuhyGuZVn58atbRLJEMPxPGKhNuJm0GzMJ0gCs/mHyGA
         sQrSUVoroMKyqWtsgeh6neA2PveATWsZnmUdn9VvtyVMKuk9gQBdHOiqypekLq0XsLOq
         JmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212082; x=1782816882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWcWdfbqWjmo3Hmirb/T4Zsz8/hT0nBX3ivX4r/x8OI=;
        b=Aov7uS2YF6khJwWnP0csTskNe46V0duC428s7eYbSfqQV/8cmllhCUjnx1JEEm3bz+
         tptE3lSO14WbC64PxpLO2Kqm+Uy186u/94vPUpebaxeAMaOUzbRBCiYaHD6wHdhJ9rja
         FGs3dStgKHFTA676hlM9Zhe+u2jXJiRZgNnR8O2yJae7dm9Q5E0Kkzny8e9sQ0+UBzYc
         BE2d5BeFfaDo2L0jM/JHRGi/eYQ+ia9/yPUt45NRiVj21nRbXq/4KseMD4NoNm+MSmn/
         q/SuFvr0VfQE/IGLpgqybyBuHVJzTtHcl+5GN5ukkIqm6rqoqk6k9fLQk5gf9P01Tf7G
         BxQg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9Ky3WcIGksTtGMXXEJUULmQtzMj1v90vuUdfjoHeIAK0rCRr/hKoObSSfm57SgNZKBjZeOfce8JumhCqO@vger.kernel.org
X-Gm-Message-State: AOJu0YzWIE3DT5Rs8pYJo9H0C4ESu4iNbFtaREwKjKr/h8Wo1OwvCFyu
	UUrpRcldoP144oPpfxNlGL0Xb6uPGs/cLFuDw07cM/N5BmROXfZGeLwNsMidA7lEvKjX2VwLe9J
	DW72YbSDaznjGbGFE/N/7IbtADwV4bhfXVBpphaxRyDb9Q/M7Lrw39Elb6aR/3zhrIglb
X-Gm-Gg: AfdE7cmrGmnLb8O6rz0axTNCd2dY/KNif6s5EtKlQAca0eUPIJWTGbc3eV+Mn16dbKG
	ySGB8siuVzCP54chdtFWg0bs4+WRYU+iasiggB1W2PAXGp7zdE8nAQMYQB3lZEtL/JKMks2ritp
	X3+vs1lFOaAR7G6/fQfEqZd77NXL8+G0lM+kTSCBo7wypuznreEunA+mL2QfqI5WeJrohLBZ5nF
	I9MOQaZiZufzOXpMl2t4YswEyJSTTq7d+GdDq5xePcQyAO5n2guMT5lCHz0ueuR7I65VNP39mKZ
	urUMKtmH7lIo7oWo+zpV7hSNJgu4WAMRunlmFuqALKl3Vl9ZuoobUctmHwf80HPT54JvBFus/JB
	HFBb9mp9P7WuIpAuqkTui3kdiuphnZU1OlpU=
X-Received: by 2002:a17:902:cf03:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c718f856ebmr209223695ad.34.1782212082092;
        Tue, 23 Jun 2026 03:54:42 -0700 (PDT)
X-Received: by 2002:a17:902:cf03:b0:2c3:bab9:4961 with SMTP id d9443c01a7336-2c718f856ebmr209223375ad.34.1782212081625;
        Tue, 23 Jun 2026 03:54:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:24:08 +0530
Subject: [PATCH 5/6] dt-bindings: clock: qcom: Document Nord GPU clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-nords_mm_v1-v1-5-860c84539804@oss.qualcomm.com>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX9P/YAks8MGIn
 vJqNOw0bcMq/HMxbQ8jWnyQT7VsifFMU/OLfNfj+/yZdhp3d9w5XamMLHIz+2mWb1oYPnirgQgN
 BMKeX9eX1wPHTv1sK3asN4rnEuOG7BI=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a65f7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gsTgLEnmQVXtJsNGj50A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: zooN83v0l9ymBCbdZmB3B0FVt-cyvlt9
X-Proofpoint-GUID: zooN83v0l9ymBCbdZmB3B0FVt-cyvlt9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX2aRZSJyjjznJ
 mM3XLKbaE02Pr8s4cBoRVLvo6r+yYu0yvKmjcvIi5WpjOrxKVpBXIIrwuDTGpfXxYzZd3xGpD6d
 /uRdViXWoFBK/89NHbn8kLKwLz2zQWxXncnNic0thn9KqyCkO/OVS66FcDupeg1rq4PScY6TUUn
 idUkKaS1tijyyue4VINyolWw4XkJaIHsDvfMzUYRLxShuAWuhVyJK73z3cpd/R4pOnhxt+hKzDF
 qP0iBBXXJUs2uva00CU9cxLYdPP4fBZIy8Am9hNemFFDSA5rd61sEXeaA01ONdaXuml6xYO9/u3
 XVFN+rdfw7fGcrEEDqnztePdoyF+syGwk2CMhHGQf6fGGmB9Qg0MIB7H/xZzu5FkgJh4l4q/uZ9
 fsqzoqwlHF9504r+QThZwqGmL1+ktCLpTJSNo4QjA7CIYEzLqu1SsXnKNJ5YtV3hyHX/Zw3FgbC
 5HhTIpFXTYatvfsCpPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089
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
	TAGGED_FROM(0.00)[bounces-114171-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C33E6B66D4

Add Device Tree binding documentation for the GPU clock controllers
on the Qualcomm Nord platform.

The platform includes two GPU clock controller instances, GPUCC and
GPUCC2. Document the compatible strings for both controllers.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,nord-gpucc.h        | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..ba85692240e07a4ed8e69c6b61847c5601b32fa0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
+    include/dt-bindings/clock/qcom,nord-gpucc.h
     include/dt-bindings/clock/qcom,sar2130p-gpucc.h
     include/dt-bindings/clock/qcom,sm4450-gpucc.h
     include/dt-bindings/clock/qcom,sm8450-gpucc.h
@@ -33,6 +34,8 @@ properties:
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
+      - qcom,nord-gpu2cc
+      - qcom,nord-gpucc
       - qcom,sar2130p-gpucc
       - qcom,sm4450-gpucc
       - qcom,sm8450-gpucc
diff --git a/include/dt-bindings/clock/qcom,nord-gpucc.h b/include/dt-bindings/clock/qcom,nord-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..a673e4854d6606315a63d2e35aaef07953169c66
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_NORD_H
+
+/* GPU_CC clocks */
+#define GPU_CC_ACD_GFX3D_CLK					0
+#define GPU_CC_ACMU_CLK						1
+#define GPU_CC_AHB_CLK						2
+#define GPU_CC_CRC_AHB_CLK					3
+#define GPU_CC_CX_ACCU_SHIFT_CLK				4
+#define GPU_CC_CX_FF_CLK					5
+#define GPU_CC_CX_GMU_CLK					6
+#define GPU_CC_CXO_AON_CLK					7
+#define GPU_CC_CXO_CLK						8
+#define GPU_CC_DEMET_CLK					9
+#define GPU_CC_DPM_CLK						10
+#define GPU_CC_FF_CLK_SRC					11
+#define GPU_CC_FREQ_MEASURE_CLK					12
+#define GPU_CC_GMU_CLK_SRC					13
+#define GPU_CC_GPU_SMMU_VOTE_CLK				14
+#define GPU_CC_HUB_AON_CLK					15
+#define GPU_CC_HUB_CLK_SRC					16
+#define GPU_CC_HUB_CX_INT_CLK					17
+#define GPU_CC_HUB_DIV_CLK_SRC					18
+#define GPU_CC_MEMNOC_GFX_CLK					19
+#define GPU_CC_MND1X_GFX3D_CLK					20
+#define GPU_CC_MND1X_1_GFX3D_CLK				21
+#define GPU_CC_PLL0						22
+#define GPU_CC_PLL1						23
+#define GPU_CC_SLEEP_CLK					24
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_XO_BCR						8
+
+#endif

-- 
2.34.1


