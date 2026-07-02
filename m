Return-Path: <linux-arm-msm+bounces-115826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ud2kDMYARmrxHgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:10:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9340F6F3B21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:10:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CSSO77wm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ghsGl7I5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115826-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115826-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D412303F73B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9065D3D994;
	Thu,  2 Jul 2026 06:08:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2299F374A15
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 06:08:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972538; cv=none; b=e63aF6isiRj/u72ltE5E773vnKPG69iSLfGXlXenYsdDbRnM+BFlL4HKLOQT+hN/65Qtltib3k5XMj8g9gI3bSaEzXSeYT+MNNBAvmwoBjgw9A7RdDTRUU7SxTtAY4A1QgAAIn4bYZxey+hJ9wZ2C22O8M6H7FdcY89cNJm7AOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972538; c=relaxed/simple;
	bh=3gW8zaHZTaZH07dB3PSD2tlZ2KSpbkUIrqHW/ZG2DTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRXc2ZSFpCbAk4dT/BB0URBQ823hlwZniUZNDj+e3kpkxqei81Hf+mQXzul/ecG8RRGzg16XBANFbIFuniBaT47BRemvqoBPqZtvtTyDPXJGFOFuOBiJiX/w0vDshzqTwUYM2SgWcj95OPjL0zmKkRmLfOeG3T/+dIL8SI0cTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSSO77wm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ghsGl7I5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KIL53050666
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 06:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h39sTfM/7b6zwQc9sQowY5+iDwhDzkCtqaJCY9Xe/i4=; b=CSSO77wms8g/Thlh
	QWnP23UVl5YNzU1dblemyAMvjjOaN2OOJjWkEUszw5mgo6v5spXgHnzo0NRBG1St
	vnUvqIm/czvbiWVc1RTDEDk08kHF5TjFON1EprJFbAS1xowuPzOMsms0RoqZ/WVy
	SbcNzfGsb7euAWWUdHlwQ7A7l+V+QGgjQ0Xbrr7xoj6lcJcIoZPecWZyGgeHeWlZ
	JGB1cu17q/v/XuANtgtNW96jHpP/GrTGDJadh7x1GQpIS+Zqfwx7ydPr+hLSMibT
	d2WqRH22Lzc/nhPNEQ411xsLZJPKEeTTbwCkmYXOLq9WgMaleYhtwKqYJf1SD9Zv
	CK628Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gptkag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 06:08:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c354050c34so16194035ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 23:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782972536; x=1783577336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h39sTfM/7b6zwQc9sQowY5+iDwhDzkCtqaJCY9Xe/i4=;
        b=ghsGl7I5ZvbB1T4R09DdyrdcvHM/sYER0f6dyhRip1TbId47S8orUMtvlG97QXf9E+
         +7h3hcuUfUHCCs2cOBi0wWHLBrKifH8RU/Xpi1w0zffMxq2bpAK+VoxXdGhPE18lNn0S
         Nh7f5CyxmU4bGHuB8KHWZvNwkxM34fJ4GR+++eeR9cqbPH8GX9rZ9OnxcPSDVRF8z4Ox
         yfxz695456MH8y4r4RjQEYcCiv5q6WmO4CUmziWIEZNYp+B1kdQ1Gu9XpwKlevy+YA5L
         pMBPjAm3jVvnlO4Q3dHKBOunBP7sSZK4INGjJ+EE6X+wchOwGknTBkjUd7z5+qMrbzxp
         oIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972536; x=1783577336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h39sTfM/7b6zwQc9sQowY5+iDwhDzkCtqaJCY9Xe/i4=;
        b=PaDoBtkHsz2tffxHJyPv76EWaBW2hu4OrB17jn02wL2O+taA/WdaWLaxQbfsBsPQ5k
         2gjUMxgsn7PH/q+nLp6A1p7RVdxGxKsarKWmfj3FurOsnHnMITo0cdunchhtlUePbzkh
         SWINL5QRXHyv4ImXktdiaC1OPvwgDkCAkeNJbGvqVH3X3yXdRbv8d5N2wWolVdBenvyj
         VbzmZkl2Vrgwdobjwqfjgiq+/8ZyS/7CJSfSr7KumMyoTmbSogftj3NMhgV3mlMlSxKS
         TS6IcqXACBaZH/JesvERvkJyKm45wbILHhSc85SJj7BU9/YX3KJCnDl19WWGluvQ8ZPg
         FisA==
X-Forwarded-Encrypted: i=1; AHgh+RrzavRvozXY8eWELJjHEU7ybk2KHwB360TDQYVz+kaM9W3lvQCAeZgmuchkf+FfJrKNOjjI6kR0H8W5JCO/@vger.kernel.org
X-Gm-Message-State: AOJu0YyZvNaYHgHyEzYGnbdOm2fbjskjHbTfzbs0uW+lg5tDvu/BbRM/
	w2y8geFUaqi8HPeNmiQt7TT8hMcfNdNRJQ9EWAmDNpAdJA4bjBUWtN8KwQY6+5lSHujZg9Q8BmJ
	0ilfkJXImq43F05wQC0myeQgbThaJ+sPfK/BN0tiy5CaHVoaJfYPV6O/E0+Sd2Afdo6xQ
X-Gm-Gg: AfdE7clkl0WNBOWEMRZ+RcByM8Q3QTwGkcinvHBGv75fsFYotNubXeOARW53ZUSt9qD
	O3mSPT7pgx+1A6bzRgPlDsyKuJc57TMeG00+YtNZxMaJFOnegPqLRODKLsmMmVMbdTFkZIkHeKm
	ZYDDCS5aNfkkxvioJUrBH6H4vPE058TFS9cH+Y+PEodQ/YlN9P6R+Zv9bG1XZbmS6hfuwc+sThK
	PUhzHnQkLNWyCftIpeE0doXAnoR5DcWdUhg5mJCwzXjFBTb/iBXcDqH5KOUaHsJwPfMcswf5FTN
	JaQqI9npGI8pGtl2Nsf10c3VnbCDbsZvcKgSZYtlO1JBXV78uyaw1BFtKJOGkZ+Qxx4hHFiUoBq
	cOGHSGC3hsUVVNnlQcHkZDGWZLj4niT3KGZbJLXaYCU0n
X-Received: by 2002:a17:902:cf0a:b0:2c9:b480:f5d0 with SMTP id d9443c01a7336-2ca7e919a7fmr47080255ad.39.1782972535642;
        Wed, 01 Jul 2026 23:08:55 -0700 (PDT)
X-Received: by 2002:a17:902:cf0a:b0:2c9:b480:f5d0 with SMTP id d9443c01a7336-2ca7e919a7fmr47079835ad.39.1782972535001;
        Wed, 01 Jul 2026 23:08:55 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa00970sm8176325ad.71.2026.07.01.23.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:08:54 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 11:38:21 +0530
Subject: [PATCH 2/4] spi: core: fix sticky -EINVAL after
 pm_runtime_get_sync() failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-2-6ddc317011c0@oss.qualcomm.com>
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
In-Reply-To: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782972515; l=2420;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=3gW8zaHZTaZH07dB3PSD2tlZ2KSpbkUIrqHW/ZG2DTo=;
 b=29q6KRWQU8V4i4fHxADGTApIS279oVcDa3pNLRh5g5n1yTQmxQyfbqUR7NucTYjcZ8NTVr/Wp
 J3HsIQgJDIfANgr4Q9vXDiaSNg2+I7qAPx/Gz4pOL/3+cx5wLvxkVUM
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfXznb/I7T7gHME
 ncOpnbZcsdb7sSi2Je3oN9A9xr9lzvAbcmpBakdf0Rh57XeaOwlFBzq/10JamDmOcAKT4+6fxSV
 UXiKA3XsY9KDPthfed5lFjl0I5pdkX0=
X-Proofpoint-GUID: cnnqiFaOuimx7jJu-a_Bu-_CPMnqWllU
X-Proofpoint-ORIG-GUID: cnnqiFaOuimx7jJu-a_Bu-_CPMnqWllU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX12gDH3RugBGc
 zWoLNcf6x8z8Zrg4Rq7yGsHxz3GosklHrYB3eGx0tnjeNUz7YsjbpuAZHBS+HNVV8XfwSP+xOn5
 3CMNPG53SaaTfXA98ejh90Vdt0Rpaj1VQ65NoEjsi+QInQnnTH1SM2qHfkKs1QwJpXvfjIatFU5
 7ZAD2c/slHHxr03LzMrYkE/o7bTE5k0yRhGlKxsu0yZzp/SmuNSYVd3baZbgnDxZqWdCM+FPtFz
 NQTecun7Ndb8khl/ZUBvSeWDGzkQVeY2wjU4DzV+2b2ZIFjF1IXvBCa4M+hD4i9aGVEvJBrrxqc
 BwmRgZVsUQjyibSgzva/5GRGhAcJVaslOe0zYYaNQ2YZMqQ9x4sF1Nh+cn+VKpT7cyrKvaD83jX
 +TTyDrT4Cho+Hz+yC8SCnT6xgxeFBmkROD/samDkwU846RQeH5Y2JJuSeWK5+tnHscPPLuWtIvP
 bIOwQ77rj3bFUown4vw==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a460078 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=02vcd1kolNyrAxwz3cgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115826-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9340F6F3B21

When pm_runtime_get_sync() fails, the RPM core leaves
power.runtime_error set to a non-zero value. Every subsequent call
to pm_runtime_get_sync() returns -EINVAL immediately without
attempting the resume, making the controller permanently unusable
until rebound.

Add pm_runtime_set_suspended() after the pm_runtime_put_noidle()
call in each get_sync() failure path. pm_runtime_set_suspended()
clears power.runtime_error and returns the device to the suspended
state, allowing the next transfer to retry the resume.

Symptoms observed:
spi_master spi2: Failed to power device: -110
spi_master spi2: noqueue transfer failed
geni_spi 988000.spi: Runtime PM usage count underflow!
spi_master spi2: Failed to power device: -22
spi_master spi2: noqueue transfer failed

The -110 is the initial resume timeout; the -22 (EINVAL) on every
subsequent transfer is the sticky runtime_error; the underflow is
from pm_runtime_put() called against an already-balanced count after
the unchecked get_sync failure in the driver.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index f897789a44d1..8d5c8d7c5a1a 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1746,6 +1746,7 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
 		ret = pm_runtime_get_sync(ctlr->dev.parent);
 		if (ret < 0) {
 			pm_runtime_put_noidle(ctlr->dev.parent);
+			pm_runtime_set_suspended(ctlr->dev.parent);
 			dev_err(&ctlr->dev, "Failed to power device: %d\n",
 				ret);
 
@@ -4016,6 +4017,7 @@ static int spi_set_cs_timing(struct spi_device *spi)
 			status = pm_runtime_get_sync(parent);
 			if (status < 0) {
 				pm_runtime_put_noidle(parent);
+				pm_runtime_set_suspended(parent);
 				dev_err(&spi->controller->dev, "Failed to power device: %d\n",
 					status);
 				return status;
@@ -4121,6 +4123,7 @@ static int __spi_setup(struct spi_device *spi, bool initial_setup)
 	if (spi->controller->auto_runtime_pm && spi->controller->set_cs) {
 		status = pm_runtime_resume_and_get(spi->controller->dev.parent);
 		if (status < 0) {
+			pm_runtime_set_suspended(spi->controller->dev.parent);
 			mutex_unlock(&spi->controller->io_mutex);
 			dev_err(&spi->controller->dev, "Failed to power device: %d\n",
 				status);

-- 
2.34.1


