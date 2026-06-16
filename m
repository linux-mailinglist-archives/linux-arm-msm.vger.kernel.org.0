Return-Path: <linux-arm-msm+bounces-113276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pDiwGzGTMGpyUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:05:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C168AC53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:05:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q8hJXL97;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eGk8KGPJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113276-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113276-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5184A30AA7DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D1718AE3;
	Tue, 16 Jun 2026 00:04:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C002C27707
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568285; cv=none; b=Ouk9CADYn6DgeWy22owoV1JRFg3h4g6g6ENDeZgPHznEKZFtS1mp4X9pejpv9bwFQ9PKTE6WCJmOHjQJGoSEz5Vor9Fpol7TvtuRDMyJt8kxM0825G3KMYmUEhSJ7Q82tGsezBvlclLMbg1sZXlZfj2ePeqvZ1L3nRLzjjzY66E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568285; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mimF4wgIaHEPaheXeLqqBNcfn0xtxzfR0yxXShVyBsOeBeeDDJsiIwsE/U8j6hiL3oUpsZWix4tYKSo+TIcbVsYEO4XM16eZ3D8cLR5hEbtloaiTTm2pCyGUVHVQDVi0msqWpXSC2OQJJvWr4SohlmfMJor4DB0/aQ9H0YDit4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8hJXL97; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGk8KGPJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIwx5j3577873
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=Q8hJXL97fpT6SiQz
	hOghPQQiUWmZnEM06tpv/XOWxpw4PlLtsCYM7i531FDHvoT4tQCCykbV73MmiGaE
	lfimdK22su0elw+nse7VVEZZrCHps8lWCXbjj52ah/ptMFTevlexI1JRe/sZX8DN
	n0qhu+yGpFOhExKl23EFyo4oQ32kqKS7icbi0Alfg5eDUbqmb1y+BoOUu4vw9sc1
	M0zreiF89q8VgGCRB7YZJcN8n3mlPcoSFyK39urpU41kba56pqS6FB3bijAgkeao
	8d2fl55mNaQjS06CWnAEa9hpg2p2EHxkZZZspwjHyYE/37zChHe4mLsH1otsgaZO
	NstyEw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ete983tfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:04:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915d1d4fc5aso674413785a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568282; x=1782173082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=eGk8KGPJsbQDprAUWQh9gF+EjKYgrCBFbKvh/tnn68kJTchrMMhopWjK/uU2ulBTK2
         ZNBnLBj9epSwcESWFx1AAGCPuZ8D575dVnPmHMb2VSh6gZ8ZZ5V9JWP/mt/Gx/BLgWtk
         LyTqfrJvIl1/thvLJnmhyKf/qUlHYMYqAmjhMTjmLHDY88hcy0syfDsyIgSyb3H79a88
         s36tzCop9LSNYJGewZvqG+H+HTDuNTXE/195UisGhVoZnuadM5j3q0wyI6ZQG0pioCr8
         N/HwsnfS44QmoJ3kR0STFeXihWPkw4k7vGSyimRkdib59JGjqO1BI4JeimQp8SvaTnCv
         FOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568282; x=1782173082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=J/iwJmxdvELoT7TPllz2/bfne+3IcOQsUZhKoFEV/u88E17FSHMswhYsRKYAZQUWn4
         hJq5EwZNRf53gaMoP623WSzlDHQHBBe8cJUO4bFFEsx9x+k1rvkKNXVklL5uLPgqi0Z9
         WUqWLoyL9w/HZyxK/R2hsl1OxT8T7xb5KxSc0HFQHzbqaySskFc5aJyHB5Mf0gM+0i16
         zfK42vWShYztnMbPeeWz2+RewjVx01Suvzbg0ojaiJ5/K0ODl72GRgdRedS2r8/LDF3q
         LLhmpYoqKfycNKiuQuelNekCjH+9OSVOW6JspoQJx5uz2m99QNREXQihbq+Vi4wMYOMd
         f9Qg==
X-Forwarded-Encrypted: i=1; AFNElJ8mEtAoqFLxzq5O/+tj+4qVu71syY38wYhqPpO/Vl9r0iqHxjoqKs2l4+PfV/6m4zamM/vegh9kA/0Ry342@vger.kernel.org
X-Gm-Message-State: AOJu0YwxTxZt+9kQgGn7AfywawSFhMzLmuP+ja5UyC+FSCfCkl+Wd0+k
	y4Bd+DLHZJu0ZQUuNzDTwjbsuwwbZBYoD8vANareJVJKvck/k9KniR31GN5ADewGQlBNhF1dkCp
	Fb3uh1Och65rbE1Ubb7MdBnhHCf9XGjG+6ydsI3m6ymefhVRdJEae9xkYPqmmG3ds4Ri7
X-Gm-Gg: Acq92OETHXNtTcNNquofiangMov/o3yFeyI9S/Tj3julCFU9nqlEQPSQYJ+Q+G3J4mG
	uX25FMuN5FR3TRxYemzDrWua2unPhWWEoJDin10XJ9DNiw9eUFR41B9Cj5y2wzfpUyfJ/ReR7Av
	T9br8dI3I/rzaR+XWaucIDRRMf6d6L4ORlEK8vKc37m2gIfJ2f9kppclr3j6r6qT4GZDm/vhwB+
	3MkoD9EzWf8gpHoBjYCX7JBpsZsnLTbaAWeRUEYUhuA+QXILFadJkx3xvugz3ifbHwyKpUY9pNi
	8sIyfugAcn0cg1vNQCdoGnt2rUKd4jKEGNyheEOhO2C4VVE8D8nFrC4sURC0wew4fevS8soabIK
	GUNaBI5OCkpJvazKH8xec+2LmT3Ti3zZ0A0LfaV1ZyUpJ0oYCUH0jI3yn5UyBuOHsDJHGR35qK7
	TO2CRZVTw8FcTtCy4D8Gljy5Q2yJSSPRjCPBo=
X-Received: by 2002:a05:620a:4095:b0:914:7b1e:a5db with SMTP id af79cd13be357-9161baf57a7mr2579161485a.4.1781568282131;
        Mon, 15 Jun 2026 17:04:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4095:b0:914:7b1e:a5db with SMTP id af79cd13be357-9161baf57a7mr2579156785a.4.1781568281627;
        Mon, 15 Jun 2026 17:04:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:28 +0300
Subject: [PATCH v5 01/16] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-1-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMNjdNQpbBcgQvuiqQf1YgzDa6ZzxLfNE4Jz
 zX/dg9DWXiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDQAKCRCLPIo+Aiko
 1VacB/9K4Wu0T0kXH9C7EgJCm4yN2GDV7JYd0DSI1uvFMft5A+yL7bqojC1pjrAY506zTzHwokV
 IM2rYgdMcbjYHYYv2xPPgoiwIhM+w0VGp9eSvmvfunkDx7z+RNru48C4G1HEemHOqo7bkpdRLfi
 7dLcFiQCZgHdTll5ot3KDN6PHheAu0pQMSsXykVEr3zJcGzanUsRFbWr4R8ZoXYIqgWQ1KEG6bS
 E0ljp9rZwaMNvjw9j3YRMm0i3fturGYQ3pLHpq9r29tD8H0rEwgiL2KopLp8YuGynkhVAD6F+rq
 J48H4ffbaRTDZleRgADPNicdgntm6HO5Sjmh7ryaGWoNlqiJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V5tNF+ni c=1 sm=1 tr=0 ts=6a30931b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 9CDQKdf_gfTtjtW6trX8Lb_J-S88mfSM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX7yp32NYa9fZ1
 5+5RbXcsoUknDqm0PEoYfaVTo2XMJ3zaY3S/cPDz9k/+tnswofcKM+cPhbheMQ5qKrYzzO/7l0D
 PFv8y/hBFNcLQvKlIPEWMwIzrvtEAgc=
X-Proofpoint-ORIG-GUID: 9CDQKdf_gfTtjtW6trX8Lb_J-S88mfSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfXyj69VWq8zheh
 n6kXzBqSU4FqqKtQRjOE4JOh/enx3v4fI0N2jLfLLc2xNlLYHyNiXnbCBVlx/VyAkU8ro1smeMk
 CyW+gvQxg2Sy39pmfgth6BsS3yZ3AQMa31TAAWBx8gy6uK9sJyDx7p/YrCiH4QDkck8tq1G5fM8
 GsbB21880dVweqpOME+uCdcwnXb/X+6V3kUqBDtnUoAZbV1ZogvUV6Kkzf+2N/HCAhEGUTDF8w5
 lW8oxyD+K7tO0/F7FLCnv6Cv7eWkUfh0neS7l9Xq3r3XDffKpzxp63ekSXfUxzGqGsv6U61pGrU
 n4I5QCIJVQzgC8XWA1vQh1pz8zRzmpgoqjesmXw6f/TFmWEe1qLPuJAoO+RqKUXVNB+kDrgfuKA
 NPgONIhppwWR665MQ5P6q386hBvqIp1Qoszpzd5WIgNr4/T2apU/76ULIHhAG/ZV20+2Q8kzLkB
 i4AcWQ4qZnTTfOMsMBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113276-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC8C168AC53

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


