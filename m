Return-Path: <linux-arm-msm+bounces-113211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vvyLI6AhMGpYOgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:00:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6A688067
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 18:00:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kxl4yGpH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Opj+o78+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113211-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113211-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07F343083090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21BC408033;
	Mon, 15 Jun 2026 15:50:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6054071D6
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538618; cv=none; b=Ej4IuBTpEOFZVF8KiXcz7WEhUNf3niqkUqRsvEerIAhrG874SkueCLfbggXj8abEiOlTwPCjrGCTU8E12fRTdweedu9cJZR7YjsbLgqxwr2sLR07pY9DweA5N2p35GJ7VjC8KHKSvC01ygLzF1zlkyAsdh5fi4dkT6l0poKJyBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538618; c=relaxed/simple;
	bh=ISiRgivrUNgXOhGrRFrPfm9qU6CKJwmw7F3QXOx8h3Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eU89LJwYBj4BUdc6FCP7m5BxGd6VLTj2RNZ73RhqhMmwSCEkIvXJxGgWKetPTSxYqhKalKm8PbKPmb2fEUNc8v/34tz1DOz4slm2Zs0RoVRnxufdgIHLrEutb6tSwQzgJ7BoUK9QJEX2Tj0c2X2lvMbtY9YZy8HmgV1nzzWvlE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxl4yGpH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Opj+o78+; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhV8V449178
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hgBdpyflpofnvhZU51hgad
	KfJjYrEnSPY4mzVt1yhrU=; b=kxl4yGpHFV3A7/QIyIfrXxy2i66HFpv7NnoiuD
	QuSP5tJZvg7a8eYfZYBRG3rvM58XzUqs774jovj0HjsS6FTsEtTXD9tZqoazUWPu
	9Lyt6Wq7mIG5DDpVSEzA760mv6Ws3eHfnnURYYE/mta68O1DP872ko1ad56yWThv
	nEsgkJNr0ZfXWzu1YmdJlZSV6Ch+d5JttM4KVP9uvbFDDpMxIy6FOLFrsrBv0NdX
	R5jKn+310f7sTwov3Z+PvHvCvq4WRnVBtHRLNZM+OsZqXw4X834+7KHzXPNxGpnQ
	+11ElaOcJiDKbrOez3gJeJilCNT7yEkst7ocSGXcWGfXTK+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa71esa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91578c374easo624707085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781538616; x=1782143416; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgBdpyflpofnvhZU51hgadKfJjYrEnSPY4mzVt1yhrU=;
        b=Opj+o78+v0wOppterPAvaqr/GUm1+k+c6H3G+ThDGHKB9CXcG4cp5sroSlI8MPZWaQ
         LzlszCNqesP2BCp1GLVS87oRoZuKCCyVF9dg+Bybuoa6mJ4khBRHgvULsIdrPHwm7ppQ
         bDuKc5JGBtShtbB6MQjw1FqFvEOvV0ALH35ijJVCN4GC07KJ+YB8T4mC6pLmvdGtstrr
         eUZX/mE0g1BGfgm/4drUQLTnTJnSP4tVn4Vrkwsl2ah9q0Hoc/uOUP9qWiTomUJkCT9G
         +6fE3D/nOXGg/8rt0KWg1L/UH4AlU3NLs0gjKMfT463bwmbMcKJlULkrC8ugGj83A1wf
         hF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538616; x=1782143416;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgBdpyflpofnvhZU51hgadKfJjYrEnSPY4mzVt1yhrU=;
        b=hf2O4m4tWT1qyYYnkLhG2418wQT+9RGdzNoLpKkoUf+1oDzBwckzpSYQoy2iJ4jpxh
         aRSUjX1y4w6rYUTnnjZzJTMwWpdEWpEGGT+W/Lm3xJHSXuVORCr+wbnyy0Td9bVOhlAJ
         iQlSj9NdbQ6pGS9rS/jX6D6Cprxckwj0rPWm8J52Pne3Rm8uuUQhWSs4pYyTUlxCvAHE
         zllWLJsvqfD383wpyN3ccqikBzeQ/Qo2J8e/32l4ebZVipCt1TiVUbKKktDRsvkvWPqQ
         axBEgmBrQNdzgCb8l3K9xi96nTJo7JSNMXyxBvfojaKq/S3aScvNM66IcKIO1C3kMU7d
         2g/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+v3niCkVADwzOOPf8qR8thr0Skrqrsa9jC6BeTd1GAsYCOm7VgYuRCr/i4aJ3pl1cNiWxsmTx07X6r8o9O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+W0CrsgyzcQck6WDafwLSmRPsJMDcGH1/w1inG1VDZp1kxZtr
	p/PoO7J1dG9x5vUheasIzAg4+UuwmErNujCizyvQnQgNbsUPOwW0hSM/xBiTpv+MN2ucgf9USRD
	Mzy1BQGp+eTnXtV8f0h6vYwkIiIAWt+CemuR9S78jIc8/+lfq/HjDPo916VlPQqt/NRGiDxcHm6
	D+1LA=
X-Gm-Gg: Acq92OE4DRK+C7iKtu7lc5kX/jgFNBSQYpvXUnnE3kVGDytKSx2NNlwqkKnXN3/Koav
	zM6+cwFyZY+KGlyk0rYQWoYloFm/XxXvE+3Rw+/R2kVHiubIQ7TaNbtoEHrK/Ok9MPNuZRYpVGz
	opT8Ha+zQWw31+SR79GU1V6R1sw54IajFGSD8/sc2eXkO/Duxr1An17UBXW04Fm/WlH6rnTJXsQ
	g7PAB1q49m8sQJ/E5aZB9Q1cRL+TABWFaKedJbY5LNQwRA2mdtC5NWdrAMztoaNPF2aQBpR3/9z
	yYKXNuRVThw2RwPTgD7ko2IromOhl0KW0Hb6E6nhY0ah5N6XHAhXcQPxMyTMQ5uwmvvI4fFVQMp
	5JgCj0LaHum14fAvokDRqSxvBydgBIttAkqeIwZ1bgrkEQYTxT5c=
X-Received: by 2002:a05:620a:1a1a:b0:915:1359:fc5f with SMTP id af79cd13be357-917f03a447dmr1728336785a.14.1781538615878;
        Mon, 15 Jun 2026 08:50:15 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:915:1359:fc5f with SMTP id af79cd13be357-917f03a447dmr1728332385a.14.1781538615498;
        Mon, 15 Jun 2026 08:50:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7fe3:eaf0:5a0b:2610])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f450sm38643032f8f.10.2026.06.15.08.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:50:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/8] crypto: qce - Fix crypto self-test failures
Date: Mon, 15 Jun 2026 17:49:51 +0200
Message-Id: <20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB8fMGoC/x2M0QpGUBAGX0V7bevYULyKXIhv2RL/f1ZS8u5OL
 qdm5iZHNDi12U0Rp7ntWwLJMxqXYZvBNiUmCVKHugj8H8FqFztW5QN+OJeNqE4CbaqKUviLSMY
 37frneQHlyoYGZAAAAA==
X-Change-ID: 20260610-qce-fix-self-tests-492ffd2ef955
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ISiRgivrUNgXOhGrRFrPfm9qU6CKJwmw7F3QXOx8h3Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMB8knXSBoChoC0KUGmOGyvXEwxpwsKvxGgwjs
 H1GtGd1/YOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajAfJAAKCRAFnS7L/zaE
 w/kRD/9lMC0E/LMqNvFfT5gMTbuEpqOs5YKPBoDR60vOhptFBhbGfYbVuIdpYUG3i/wPM6Jvazu
 uHmnXklFdYCGMd9T6VLMzcKpZTbzG5BTayxpX7xfpYRStZUQEKBLNQ/tq4t8iko8E6pdkmM9cgj
 0nYI7iEdwrNxLUo6pbVEpb8Ue+KeboMzJLxS89aEJTeorNvPu2d9myOpbzczDrJ61NVR61Z+dUb
 uo7IvcabJD7tDUD1giN1cJH2DFDi5XURUMiik8RZgntAcx9vN8V/Y3jMxVkz30hsfftzGhovMsI
 pxzVggkw/UDPvFSI+lelg7SxXM5f0zb5jMRCq0H9hEyh60/hXIdhzJSvcjaQ3tOl9I3uSwzDGNU
 h2b5zOhLz3HoxvuXFiUSLELATwmMKrQozztF62rYTHUCJGUmag3jMDskNNYvEH59UNhIK8F/19e
 7g8fODVGqjo31LC0GcxOEUITbLt7D0habQEJv1VVX9tA66Mu2kdCwIfqY7K0+/Xcd0sA/bXQnqd
 QfyrHtA7zcE4ovAjOrnsrS56qJpKE5DfNGt/itMskdn0NZHLYmP3zNUDFaVimgfAcZa0Hpw073p
 KF4SyisQ+cvU7TzpIDSHhyunnzi90nJr3w86n5BrMI5n0bDifGryfJCIa+qahB1CKPKHrg3lLsH
 I8yluytD8zAmIWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: pWVmRMrELqg-y4FYaLjTvjBWKIlevlJX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2NyBTYWx0ZWRfX1kz4rmoSPNc5
 z6dTvh1VkwDa88/fBVaKcpQcgA1yQiG9QvmVZWrhkonTqf7vDxqzSIYF4mfE9yZb/6qvmgu/VCH
 XIc4vcfeBze5YYLf45fEJzbFEEqSxbM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2NyBTYWx0ZWRfX5XqusOWbxPOE
 HqD8InBmrcj4Cc4uViaUv9ZSX/KfbQc2NGZMqPYp3k4f/oLccDQjEdB7L8Hspz+Ist4SP376e4L
 T289rrnlyy9/rNMjIggirrPk0zzxR2XnlI6YWxC2TQbOzvs8bpvNrSRI2pLTkfAq2DMbkj15TFI
 7D5haIs8J6+weX0b/9GNvhMP1FubmufE1QIR7+XTa5DZP07Bo1pIoIFt7WU1I/XTL9gD+14Tspo
 3F/EYzCIQM5/MK+2dc5tnU393mjK24fwzP3edy1RXy+xe8nof8KmliuidKzQOBdo4n3qWP/os85
 9B78FoSew2McGuhS8iI73i3lpcsWORTDlJMh2cEHW7kDPFdQfVHF/mcjmHwzc6BPuN1b6hQvHCi
 JemaUos9b2K96haofo05i9dPejp53Ytfkr0EfgVkPnvkxajoAub8xC/+4AHMiIeJ/PZNvFdoxO5
 y1BLj1zMARLUI/y4rfA==
X-Proofpoint-GUID: pWVmRMrELqg-y4FYaLjTvjBWKIlevlJX
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a301f38 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=5rERACauPDyaBIpbJ_EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150167
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113211-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,msgid.link:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5C6A688067

This extends the initial submission from Kuldeep.

The QCE hardware crypto engine has several limitations that cause it to
produce incorrect results or stall on certain inputs. This series fixes
several bugs and adds workaround allowing the deiver to pass crypto
self-tests.

The failures addressed are:

- HMAC self-test failures for empty messages
- AES-XTS returning success on zero-length input (should be -EINVAL)
- AES-CTR: partial final block causes the engine to stall, output IV
  derivation was incorrect
- AES-XTS with key1 == key2 is not supported by the CE
- AES-CCM: partial final block and fragmented payload both stall the
  engine

All fixes were tested on an SM8650 QRD board with
CONFIG_CRYPTO_SELFTESTS=y and CONFIG_CRYPTO_SELFTESTS_FULL=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Add fixes for the full suite of crypto self-tests
- Add Fixes and Cc tags
- Link to v1: https://patch.msgid.link/20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com/

---
Bartosz Golaszewski (6):
      crypto: qce - Remove unsafe/deprecated algorithms
      crypto: qce - Fix HMAC self-test failures for empty messages
      crypto: qce - Reject empty messages for AES-XTS
      crypto: qce - Use a fallback for AES-CTR with a partial final block
      crypto: qce - Use a fallback for CCM with a partial final block
      crypto: qce - Use fallback for CCM with a fragmented payload

Kuldeep Singh (2):
      crypto: qce - Fix CTR-AES for partial block requests
      crypto: qce - Fix xts-aes-qce for weak keys

 drivers/crypto/qce/aead.c     |  72 +++++++++++---------------
 drivers/crypto/qce/cipher.h   |   1 +
 drivers/crypto/qce/common.c   |  27 +++-------
 drivers/crypto/qce/common.h   |   7 +--
 drivers/crypto/qce/regs-v5.h  |   1 -
 drivers/crypto/qce/sha.c      |  93 +++++++++++++++++++++++++++++----
 drivers/crypto/qce/sha.h      |   1 +
 drivers/crypto/qce/skcipher.c | 116 ++++++++++++++----------------------------
 8 files changed, 162 insertions(+), 156 deletions(-)
---
base-commit: 7f5e2941e7dccc9dfaaa23d0548a40039772a284
change-id: 20260610-qce-fix-self-tests-492ffd2ef955

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


