Return-Path: <linux-arm-msm+bounces-112062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rPKgAfTTJ2oY3AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:51:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0E065DFA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:50:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dsOCcKvB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jNcIeAdT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112062-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112062-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E88B3062AA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D10738D3EF;
	Tue,  9 Jun 2026 08:43:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26050371D00
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:43:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994612; cv=none; b=NpE8szehvEuDPsvm9wwOv+pzlnALo9qXzhKEZOK67p8Y17PqJBe/ZYm690xaYG8uYqcRjiDGJ8GOCze+hO/CHhFPu7MeeDW2ALLaUlfZkWyfeazsigdg11g4Y5Fk5E03Z4v5iMY3VilvmfysQi+V+XMwk1Cu0RrPbHiHWDV7fb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994612; c=relaxed/simple;
	bh=stn3ZEPLR1afpqAn0RrmIjAKSrCZN4mu3yS/RlOo3eg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Y5czA/lzq2wrui8/ZOPzYocfZnz+4SZAWSoucFC1g33/tEcPJk6ONmf+F/az7RG4nmKZAVf+7MnwLjAUSEJmHN3y9d6Mw+CUqF2KSoDGjz5kU/AA2mHKI5YY+WG1W1eN74GTH4du41B3xYFYSuBHtyGPFSbGqZ3vk/zU8qQybtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsOCcKvB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNcIeAdT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rPPX1517666
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yNCq2Ath3e/Fyu9ozR8E4s
	0geoHbdmxBpm5kJ3fmgVs=; b=dsOCcKvByTrHjuEHVBo3f7p7JBDN3z4008UxcR
	INoWtI7y8kPulGhU1j8ll91HA+D8ap6qJ2A5LtamOYzq7O3nhcL6JyU08PoRwFzU
	q07yP9J5+3A3Gn1ZaVohsBR0tak6dubm+KAh3wcYjVoRUVkvU/P5BaOZySNsWGUN
	fhwomfmFhwb5wx/sdoQGJVP67lMggtkw/D0pTPg+te9KDpyYQJMuvbqsFFWgsRdg
	YIhVkOAClBtu6yZp94BSg3I2C2EU1sCnIpEXgvwZzRIA/fjsSoJW4PmlUbmCfT+M
	eukD4nuZCC69nrl2vptnZYuxfzsZ3+vFCrMgkhj77kJbtxdQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr886x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:43:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0a81c1738so32258825ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780994610; x=1781599410; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yNCq2Ath3e/Fyu9ozR8E4s0geoHbdmxBpm5kJ3fmgVs=;
        b=jNcIeAdTvbFjYveo8SfvljCNAqSTLWiLJy6BmSDRx+XLJyNloLP2Bdn2KCXddBETj5
         oOZm9RVhB104Hde9H21eBBvWZj1d9+pwPCA9aES9UpKXw8bitvXuo3ig2n6DJNjhzSzD
         rjWrvliyv//UyY8Z1C7l6gxccxt5d5UAn7bE1rXyRx5GD2J2TAcvzRgPCSC4zI6Nd+IU
         50+YGFIY3X61Zydc8uElwejtFbeF9x3cYoSr/YQ1YJP/nml58mrW0g29p6xPafffSy0F
         1NrWbYPWMRr97Q8SIKdZZURkLa4ELkSApyPOhzxxU9B8HIWBIhr2eyK1n0c9RZelgkaH
         xrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994610; x=1781599410;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNCq2Ath3e/Fyu9ozR8E4s0geoHbdmxBpm5kJ3fmgVs=;
        b=qdBb85Fj4G7AhXsmOon8h4H9KHyZYnhmXwOhsmLidgQZ38MqJ9ste/bCxEinLpZtug
         PiNAGTZyaJkQuq617SRLUJFrlG1t8d2KE7zzKmcyZN9zLBwlxE5DAEtbWN0bdxin+MO0
         ntYvtrq0rSu1Y7JFLl2lraMg5SDuVMn8bl47G7lQkmWkgFk7vseWtZ8DesH2aYT1LUyR
         Ccw71vnaplnBbIMgUb1sTqmL2SaU0TisP90hvGcz7nnd9un909RAbfzIx5KrrHSuV8ee
         +8VQUX128DcrpZWADVx53dNUUkEZqW3QhbOpop08HcDCNhoVrPy0jw++M9V3g8SZIUkN
         q8Vg==
X-Gm-Message-State: AOJu0Yx+KBrAh1pucoa/vnr63qtjnEpPxidLngmEv9Rr4+tVawGFE8QC
	raBVLA5WeIAG62E3MmbutXfASPXylDcRKlFsmMjQLBVWqj7yY0hgMJob/mYfbtkuC6uOM3JcX4k
	QD7/2RUbFTth3hFB/gDXz3IFwJsLdRxybG5DMWJii9LHw4OPkP7TheWt2Cwk1tNxpY2mReaQh6B
	EF
X-Gm-Gg: Acq92OGNlXGvfvDQw4RY7oQlM//KaF4SD5n9PxbhkSfS5pOcYQpj9ifVp+xV5Yd70Nu
	InDzFbA3HzL1IyMfCYcxERY0ra/EkSVFew/JWxNbSgfegZC91+ODA14Li/E5s5TWOR2JGX+usz0
	3aC+DyIEty6ObxQrOI31X6Y+sysWc7xfGpYlDvAnGAKgn3RAvuVJvrmhakkFCrnSaUznGDpkE5H
	GiMxMDJdfLq7tCXafUrLW5aV0HeDs+2pHvz6MlSynAZ0EmxJOse2yczLpLSkziM1y/MCvLZagLz
	yrDZZxfgyq2o7AkL58qY4QWZ61tXH+oUXFyflSGPMaauU7/sHqT1SKBVu2ohsb1Ec7IkcGmdObd
	Dy/rhvGA4yhV9K8nT8g+klfNpm+RPhgshWcRlt7nX6YYOYkJIJKMmxkOSj2rt+2VpNNNC
X-Received: by 2002:a17:903:388e:b0:2c2:2a8a:af74 with SMTP id d9443c01a7336-2c22a8ab260mr164651375ad.15.1780994609566;
        Tue, 09 Jun 2026 01:43:29 -0700 (PDT)
X-Received: by 2002:a17:903:388e:b0:2c2:2a8a:af74 with SMTP id d9443c01a7336-2c22a8ab260mr164650765ad.15.1780994609051;
        Tue, 09 Jun 2026 01:43:29 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa00b3sm196489635ad.32.2026.06.09.01.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:43:25 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 14:13:09 +0530
Subject: [PATCH v2] spi: qcom-geni: Fix cs_change handling on the last
 transfer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-fix-spi-fragmentation-bit-logic-v2-1-e18efc255563@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABzSJ2oC/4WOyw6CMBBFf8V07ZA+VMCV/2FYlD5gDFBsC9EQ/
 t2Cce1mkpPce88sJBiPJpDrYSHezBjQDQn48UBUK4fGAOrEhFN+oWdegMUXhBHBetn0Zogypgb
 UGKFzDSooCirKkxC5tSVJK6M3qbIb7tWXw1Q/jIrb7JZoMUTn3/sLM9tyP1v51zYzYCBqQS2TQ
 utc31wI2XOSnXJ9n6VDqnVdP10iVKznAAAA
X-Change-ID: 20260528-fix-spi-fragmentation-bit-logic-880394337ff9
To: Mark Brown <broonie@kernel.org>, Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780994602; l=4275;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=stn3ZEPLR1afpqAn0RrmIjAKSrCZN4mu3yS/RlOo3eg=;
 b=nkbi4Vvc7G2lHmDJt3Rj5R8XMXZi/OL/bi7cdRKFiLoGGQhE2jhl5Ye03gsg95Jnr7XwSWOsW
 2jHB9f3fv61CeQtR2jnjRo7JDaXa7FV6h2yFwLqnJ2pwa9C3i0oNlHQ
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: rvpjMVP08798ekD6IQMIFUTuHMwHO4OI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MCBTYWx0ZWRfX3ryvqjtSjudB
 afR31ZJB70a+X4h6i1/ZxbFHxeLQ2CuktzWb3CizPFry6A5o+dvj+qePZRlly+3utGHCj+ZLGvU
 1tjqTirvV3fh89yH2I6F5rhK44EWpaZlwJ7Eo2Bk1v4hfruuWQQoVQbZyszTIzcsqrk3LOt8gKf
 CVCZ8Vm4X6vmA2d5u3N0OpQ8A1NU6CFEXVVfywGl9gpKrfjLS2zNLUIgf/NLPm40rEhMLut6fQx
 ahjQH6FSbh8bcKglDp/zA0H01mncJZFRwtKlkqVhcHewRVtBajpftArH6sVSFKbBjk26qtVwZYh
 XtuTw/L2sBjASZ3yBj7ptYtyake42KdN/2HXc7jyjPe/ykIhEjjkLnISS+NqKVixEBQxNDtwr3K
 tWfgPg2FQFXbmkUEW0PquWcuxdgY9Of8G3YfRJoLRJMlLbGOh5mvWENgVdj7oYQGJHSB3jlWg0X
 reqpZ2F7pDvpFKwB3Yg==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a27d232 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=RAbU-raeAAAA:8
 a=wpeXKL9a9D_Roaqk1GEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=JiizpSU_mAIq9zsZDqn2:22
X-Proofpoint-ORIG-GUID: rvpjMVP08798ekD6IQMIFUTuHMwHO4OI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112062-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:viken.dadhaniya@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B0E065DFA0

TPM TIS SPI probe fails with:

   tpm_tis_spi: probe of spi11.0 failed with error -110

TPM TIS SPI sets cs_change=1 on single-transfer messages to keep CS
asserted across the header, wait-state, and data phases of a transaction.
CS deassertion between these phases violates the TCG SPI flow control
specification.

This bug was introduced by commit b99181cdf9fa ("spi-geni-qcom: remove
manual CS control"), which replaced manual CS control with automatic CS
control via the FRAGMENTATION bit. The FRAGMENTATION bit controls CS
behavior after a transfer: when set to 1, CS remains asserted; when
cleared to 0, CS is deasserted.

The commit correctly sets FRAGMENTATION for non-last transfers with
cs_change=0 to keep CS asserted between chained transfers, but misses the
case where cs_change=1 is set on the last transfer. When cs_change=1 on
the last transfer, the client requests CS to remain asserted after the
message completes, so FRAGMENTATION must be set to 1 in this case as well.

Fix setup_se_xfer() to set FRAGMENTATION when cs_change=1 on the last
transfer.

Also fix the same missing case in setup_gsi_xfer() and correct it to
write 1 instead of the raw bitmask FRAGMENTATION (value 4) to
peripheral.fragmentation. This field is a 1-bit boolean consumed by
gpi_create_spi_tre() via u32_encode_bits(..., TRE_SPI_GO_FRAG). Writing 4
to a 1-bit field causes u32_encode_bits() to mask it to 0, silently
disabling the FRAGMENTATION bit in the GPI TRE regardless of the
cs_change logic.

Fixes: b99181cdf9fa ("spi-geni-qcom: remove manual CS control")
Cc: stable@vger.kernel.org
Reviewed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Changes in v2:
- Updated commit log.
- Fixed typo in code comment: s/keep CS between/keep CS asserted between/.
- Link to v1: https://patch.msgid.link/20260529-fix-spi-fragmentation-bit-logic-v1-1-3b30f1a3dd7d@oss.qualcomm.com
---
 drivers/spi/spi-geni-qcom.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index a04cdc1e5ad4..26e723cfea61 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -449,10 +449,15 @@ static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas
 		return ret;
 	}
 
-	if (!xfer->cs_change) {
-		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
-			peripheral.fragmentation = FRAGMENTATION;
-	}
+	/*
+	 * Set fragmentation to keep CS asserted after this transfer when:
+	 *  - non-last transfer with cs_change=0: keep CS asserted between chained transfers
+	 *  - last transfer with cs_change=1: keep CS asserted after the message
+	 *    (e.g. TPM TIS SPI uses cs_change=1 on single-transfer messages to
+	 *     keep CS asserted across header, wait-state and data phases)
+	 */
+	peripheral.fragmentation = list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers) ?
+				   xfer->cs_change : !xfer->cs_change;
 
 	if (peripheral.cmd & SPI_RX) {
 		dmaengine_slave_config(mas->rx, &config);
@@ -858,10 +863,16 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 		mas->cur_xfer_mode = GENI_SE_DMA;
 	geni_se_select_mode(se, mas->cur_xfer_mode);
 
-	if (!xfer->cs_change) {
-		if (!list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers))
-			m_params = FRAGMENTATION;
-	}
+	/*
+	 * Set FRAGMENTATION to keep CS asserted after this transfer when:
+	 *  - non-last transfer with cs_change=0: keep CS asserted between chained transfers
+	 *  - last transfer with cs_change=1: keep CS asserted after the message
+	 *    (e.g. TPM TIS SPI uses cs_change=1 on single-transfer messages to
+	 *     keep CS asserted across header, wait-state and data phases)
+	 */
+	if (list_is_last(&xfer->transfer_list, &spi->cur_msg->transfers) ?
+	    xfer->cs_change : !xfer->cs_change)
+		m_params = FRAGMENTATION;
 
 	/*
 	 * Lock around right before we start the transfer since our

---
base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
change-id: 20260528-fix-spi-fragmentation-bit-logic-880394337ff9

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


