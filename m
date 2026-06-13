Return-Path: <linux-arm-msm+bounces-113005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3SupMPORLWp8hgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:22:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414567F2A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 19:22:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GuMuwRMT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eKepvNpx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113005-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113005-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC9473019110
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 17:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D51FC0A;
	Sat, 13 Jun 2026 17:21:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63109305673
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781371285; cv=none; b=ElrqweqprQPZlMl4UC9jb8TotV8GFukUPszPdw3sg1ajdSKSFgPjWSXHnm0WUZhklBRtUXJLyUq4HZqSvEXPIRI6m/XSHkm5vpqhMkjAHNcT0dG0QhfGpu8Ps7XhdCAox3TS0EeqrsYRRr+Ico5KdWGAVBI8EESZPqlZipiNyNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781371285; c=relaxed/simple;
	bh=3LvVzlcvTfxyqrRYasoLmm+6K2iynv8qA2cCL5g/TxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpVPxGTIZ+qkWGlec1RJFqClyA6xQ2U+qxH0xFliBuvT/PgQInKS7PuexkqS+fxLMD119KqG0/naVm9eT03navjYN4MAKbpL3Dy8kQjmsGxbuRazNJkKIh5qkfLXFx+uJehHAl8CB23q6xOj7lYWh5lAURMKSxCMxxOUgxTC5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuMuwRMT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKepvNpx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65DF8p582783848
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l2jvLZ77aheSe+DZjMUpTRiQcTblxiXsbYokkj4oN64=; b=GuMuwRMT6fUnEqLr
	pC213gqGmouhs21S7DrTYvBiPMsV4SEiEZb0oYQi4HhjH4Nl8ulsTRXX8qRcB+wk
	KIoeVBFWaQxpwWXI6CAf/mOcKFNOYlZ88RdcxvVteMq7Xi81Rbtgo8ayvmOsr0NZ
	6UdlO01TF5PYz9o/AH8c6cvQkS/wkyc+ob7rhawynYsLnbJVDMqhe8zlF4Y0RVS0
	RT2GtsWwLvrwpl0vudoNb9FwNppSnZHeYbWHEbE1mlwBtMjQf7bOs/fV/sHZb0Ua
	sQAo1RWI9DoIyF/PZK1ebUw3vbajZ6Rni1T83CoN29DayOeez+CW49qqrzLjqVnh
	vQtgkg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cghh1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 17:21:23 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85c530ddebso958650a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 10:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781371283; x=1781976083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2jvLZ77aheSe+DZjMUpTRiQcTblxiXsbYokkj4oN64=;
        b=eKepvNpxdYISsjPpC60Zr/rORnTtGn8OFwjO+iVgDEZ+ALyxiPCzYfLY9RITIf010w
         HmLsFkg1G2E9wIyriAFSIQjfVcJ0BLcog53Qz7jdokks1iwGKpLz9/ktjAYI2RaOX1Gl
         kp1J5auDK9LT4I/GFLPHUHjaN9rGDGKG4q1EZ1q4p4A+QEsS03XitFyJGFsI/gQlp9rY
         PiVN2Z0g0TLPqQozmGCHACi6A2pItmyyH5guvLuM80r1Nc8cxpkPUG/TNT7GjrsgCMHM
         fThv9VpUamcZpDH+b4h5Jqa+wGePAFbfffgz1Xdp7+0agka03JrKmG4jCAbO43NMhbLF
         /1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781371283; x=1781976083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l2jvLZ77aheSe+DZjMUpTRiQcTblxiXsbYokkj4oN64=;
        b=Vg1k3QwidwxVorUUs80NgFbjHlsiC3T2yQo8G71EOgLkc363H+QWwtP2kdRMzskQ8k
         Q2nGVfOoSwNIT+so5aRSFQW5RNwIn4iuYt7e4QilaAn0eYa/Uz2kNSGfK+yNmopS9xrV
         2bjjzYy1IEFdodkpPJ5Ds9TT3XAuBlIdpum607hJGXuHhnmOjW5dlQLMuDAn6nF44YC6
         Xy8/QyMxQTFzuUnTbGat6VPLW+m3fgO5d/RLvoxy4J/zwE9FkScrAP+upN/R/k34RrPP
         XyMSnvqZ/tOUn6bcrCC2r0b9TGQrs/9wdGloqk2A3kSIFEP0wZT12Q32/oAlJeNR8QUW
         +KxA==
X-Gm-Message-State: AOJu0Yz/4Pkd9iHC0+MW6r6t6MMchoDBHUGps45VJWTncfN6m651ICMf
	mllPVWH+lVNd5s5E1DZ0f9Nb7EYosjpsKA+GW2IdTIB1dBNDPiSdIEX2XUVrezKMt6hU0UpmGIE
	BaApNESaJtnCpNFwIVPLsZOtI8jJMIJW8FS+Ku7vXoS2+2V+sPOFgvAzx+mPkt11F7Z1X
X-Gm-Gg: Acq92OFHAjZluTO3qe4kVcCR0UEfBaKEnj8mNtJKvsDMj228xzdLAHJLW4im9Hv3tZN
	jwUcBsSLkGM1T/NppS588kijAzF5UkNpvlEr8tyIQvWcEYxk0rF38oqfKTCd6b8XFaYlqeznXnV
	6gyn3zevRMu5p1UIS0R1ugDqjAH61dCUjLBGW5yp90xR07qy1uF3uj8lkZ9oDJFhoakPbwMzJ/S
	H12cdjXDATI44IwLDGyoiA54MFpWrhfwYsf3w1ouIPvcNCfAvuzFOR4X2bD1j9zPPlNCmbgAwo6
	GgsMXqT2CPwtX+pXFZWmbdgxx7r0vfranJvhs3XxEVtSIRv+8pU4gQ2Qwfr2e/9y7zWXKr3+TYZ
	QhvssC9ZR7vZIQlY1shewaikK43zcHUSxsCmGho0DOlT6rG33JglQeA==
X-Received: by 2002:a05:6300:408d:b0:3b4:774f:d18e with SMTP id adf61e73a8af0-3b783fb3955mr9237962637.36.1781371282879;
        Sat, 13 Jun 2026 10:21:22 -0700 (PDT)
X-Received: by 2002:a05:6300:408d:b0:3b4:774f:d18e with SMTP id adf61e73a8af0-3b783fb3955mr9237939637.36.1781371282373;
        Sat, 13 Jun 2026 10:21:22 -0700 (PDT)
Received: from hu-pranarya-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbec5sm5390913b3a.16.2026.06.13.10.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 10:21:22 -0700 (PDT)
From: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 22:49:49 +0530
Subject: [PATCH RFC 07/12] mm/vmalloc: consolidate occupied tree as
 authoritative index on hot path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-vmalloc_maple-v1-7-0aa740bb944b@oss.qualcomm.com>
References: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
In-Reply-To: <20260613-vmalloc_maple-v1-0-0aa740bb944b@oss.qualcomm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Alice Ryhl <aliceryhl@google.com>,
        Andrew Ballance <andrewjballance@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, maple-tree@lists.infradead.org,
        Lorenzo Stoakes <ljs@kernel.org>,
        Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>,
        Suzuki K Poulose <Suzuki.Poulose@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mostafa Saleh <smostafa@google.com>, Balbir Singh <balbirs@nvidia.com>,
        Suren Baghdasaryan <surenb@google.com>, Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>, Shuah Khan <shuah@kernel.org>,
        Dev Jain <dev.jain@arm.com>, Brendan Jackman <jackmanb@google.com>,
        Puranjay Mohan <puranjay@kernel.org>,
        Santosh Shukla <santosh.shukla@amd.com>, Wyes Karny <wkarny@gmail.com>,
        Pranjal Arya <pranjal.arya@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781371215; l=11442;
 i=pranjal.arya@oss.qualcomm.com; s=20260516; h=from:subject:message-id;
 bh=3LvVzlcvTfxyqrRYasoLmm+6K2iynv8qA2cCL5g/TxM=;
 b=nqUV4Kw0eSIXuP8FCMkdgzDqt1rMN9t/16SjpKiMChJQMzFkHtSb1Hgy1AomHVYAHaBNoGEE6
 i18NaLje/ndC3qri/cczcfs/kygPhF23UV2KxUmTnbyFs28Fwq+DAUT
X-Developer-Key: i=pranjal.arya@oss.qualcomm.com; a=ed25519;
 pk=ymtcTlccEIDsi3ErhpjIoZZHKdPBYWGWW0Lchs5MsbE=
X-Proofpoint-ORIG-GUID: 0laX-zeR8qPy_AUG2JPuIu-2KhnekZNT
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2d9193 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dDmkakLwKiWj0oWmIz4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 0laX-zeR8qPy_AUG2JPuIu-2KhnekZNT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfXzVhz3FPGApFr
 n4ydFju3R4xhtb8iQeNmlbf/YXk0XhwG5qST048YIA4kvPomtpy7Ebl5+qR15TFM3bQFEpkixrg
 QGTeSP0TwWr9zJkNq2hn1gFjf9h3yH0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDE4MCBTYWx0ZWRfX1Q8pMCY/bpH+
 0YXbZg0J76qAQ9h8d0OulHaGieApOsCFih3k3XH73+pXoFiFttGF0zLxD/2wfRURUjuNcDGbO1B
 AMeaM86l2m3Z2QPWm4CJBylE6KZpHw0+yHTV9WbrC5UtBi0LWZXqYB93xxuu4uW0d8VG7Dqeh4D
 O7W/+YXiSEl8fm6pdLFSHZ+ICbCXy0qmDt26/BJL22MFhIF1WFFbWSQNWTHnRf7+y0BtSDXPs+5
 xyvgCFM9tocAFDKlc0tlxwA0s7vXLBYVOU7Gp6EWlcHX0uShDx6GySPjD9DnwiUz8VlYvfQpJlf
 jiUDIaFakwwYXhemvaHRKogdQAvLjtX2nGHT2MDKrxdNjaUFPALtBZdd5jVgUFGZa4xRG3PF24H
 58JbF5f9asr9eZPPwX6y5yHixnRx4F+Tw7U2ec1MZDyGJAcDosdRmY+CDoe8W+zMvAos9BJiZrd
 ET95a5qluDvCLDU5QiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-113005-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux-foundation.org,gmail.com,infradead.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:urezki@gmail.com,m:liam@infradead.org,m:aliceryhl@google.com,m:andrewjballance@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:maple-tree@lists.infradead.org,m:ljs@kernel.org,m:praan@google.com,m:will@kernel.org,m:Suzuki.Poulose@arm.com,m:neil.armstrong@linaro.org,m:smostafa@google.com,m:balbirs@nvidia.com,m:surenb@google.com,m:elver@google.com,m:dvyukov@google.com,m:glider@google.com,m:shuah@kernel.org,m:dev.jain@arm.com,m:jackmanb@google.com,m:puranjay@kernel.org,m:santosh.shukla@amd.com,m:wkarny@gmail.com,m:pranjal.arya@oss.qualcomm.com,m:sudeep.holla@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kvack.org,lists.infradead.org,kernel.org,google.com,arm.com,linaro.org,nvidia.com,amd.com,gmail.com,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pranjal.arya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 3414567F2A1

The dual-tree design (free_vmap_area_mt + occupied_vmap_area_mt
maintained in lock-step) costs roughly twice the maple operations
per allocation lifecycle that the rb_tree path it replaced used.
Strip the maintenance back to a single authoritative tree on the
steady-state hot path.

After this patch:

  - The occupied tree is the source of truth for in-use ranges on
    the alloc/free hot path.
  - free_vmap_area_mt is still maintained on the slow paths
    (vmap_init_free_space, pcpu_get_vm_areas's top-down walk,
    decay_va_pool_node), but the steady-state alloc/free no longer
    has to keep both trees in lock-step.
  - This removes ~half of the maple operations a typical
    vmalloc/vfree cycle performs.

The pcpu top-down walk relies on the assumption that chunks consume
addresses bottom-up, so stale free-tree entries at low addresses
never collide with pcpu's chosen base.  This is documented at the
relevant call site.

Signed-off-by: Pranjal Arya <pranjal.arya@oss.qualcomm.com>
---
 mm/vmalloc.c | 179 +++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 99 insertions(+), 80 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5bc1e47c456a..73a40a88dbf6 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -1767,17 +1767,32 @@ occupied_mt_find_hole_window_locked(unsigned long min, unsigned long max,
 {
 	MA_STATE(mas, &occupied_vmap_area_mt, 0, 0);
 	unsigned long search = min;
+	unsigned long search_len = size;
 	unsigned long hole_end;
 	bool retry_empty;
 
 	lockdep_assert_held(&free_vmap_area_lock);
 	retry_empty = list_empty(&vmap_retry_list);
 
+	/*
+	 * Pad the gap-find by align-1 when align exceeds PAGE_SIZE so that
+	 * any alignment slack inside the returned gap can be absorbed
+	 * without an extra outer-loop iteration. Without this padding, the
+	 * loop has to scan past every page-aligned gap that is large enough
+	 * for @size but too small for the aligned start, which is O(K) in
+	 * the number of such gaps and pathological for big alignments on a
+	 * fragmented occupied tree.
+	 */
+	if (align > PAGE_SIZE) {
+		if (check_add_overflow(size, align - 1, &search_len))
+			return false;
+	}
+
 	while (search <= max) {
 		unsigned long candidate, candidate_end;
 
 		mas_set(&mas, search);
-		if (mas_empty_area(&mas, search, max, size))
+		if (mas_empty_area(&mas, search, max, search_len))
 			return false;
 
 		hole_end = min(mas.last, max);
@@ -2182,39 +2197,35 @@ rollback_busy_insert_failed_alloc_locked(struct vmap_area *va)
 }
 
 /*
- * Reinsert @va into the free index after occupied erase. On failure, place the
- * range on the non-index retry queue and best-effort restore occupied tracking.
+ * Release @va after the caller has erased it from occupied_vmap_area_mt.
+ * In the occupied-only design there is no free index to track free space
+ * with vmap_area objects: the range becomes implicitly free as soon as
+ * the occupied marker is gone. The struct itself is recycled to the slab.
  *
- * Return: free-tracked @va on success, NULL when queued for retry.
+ * The signature returns @va on success (matching the pre-rewrite contract
+ * used by the synchronous free_vmap_area() path) so the caller can decide
+ * whether further bookkeeping is needed.
  */
-static __always_inline struct vmap_area *
-reinsert_or_queue_vmap_area_locked(struct vmap_area *va)
+static __always_inline void
+release_drained_vmap_area_locked(struct vmap_area *va)
 {
-	struct vmap_area *tracked;
-
 	lockdep_assert_held(&free_vmap_area_lock);
 
-	tracked = merge_or_add_vmap_area_free_locked(va);
-	if (tracked)
-		return tracked;
-
-	if (insert_vmap_area_free_locked(va))
-		return va;
-
-	/*
-	 * Retry queue acts as allocation exclusion even if occupied restore
-	 * fails under pressure.
-	 */
-	if (WARN_ON_ONCE(!occupied_mt_store_va_locked(va)))
-		INIT_LIST_HEAD(&va->list);
-
-	retry_queue_add_va_locked(va);
-	return NULL;
+	kmem_cache_free(vmap_area_cachep, va);
 }
 
 /*
  * Returns a start address of the newly allocated area, if success.
  * Otherwise an error value is returned that indicates failure.
+ *
+ * Steady state (post late_initcall, occupied_mt perf_mode on) takes
+ * the occupied-only fast path: find a gap with mas_empty_area on
+ * @occupied_vmap_area_mt and store the consumed sub-range. This costs
+ * two maple touches per allocation versus four to six in the legacy
+ * path (which clipped a free vmap_area struct in @free_vmap_area_mt).
+ *
+ * Pre-perf_mode (early boot) and -ENOENT/-ERANGE retries fall back to
+ * the legacy free_mt walk + va_clip path, which remains correct.
  */
 static __always_inline unsigned long
 __alloc_vmap_area(unsigned long size, unsigned long align,
@@ -2235,33 +2246,41 @@ __alloc_vmap_area(unsigned long size, unsigned long align,
 		return -EINVAL;
 	if (size > vend - vstart)
 		return -ENOENT;
-	if (align > PAGE_SIZE && (vend - vstart) != size) {
-		if (check_add_overflow(size, align - 1, &search_len))
-			return -ERANGE;
-	}
 
-	if (occupied_mt_supported() && align <= PAGE_SIZE) {
-		unsigned long candidate;
+	/*
+	 * Occupied-only fast path: skip both the free_mt validation
+	 * (free_mt_find_enclose_range_locked) and the va_clip splitting.
+	 * occupied_mt_find_hole_window_locked already pads the gap search by
+	 * align-1 internally for align > PAGE_SIZE, so any alignment lands
+	 * inside the returned gap; storing the consumed sub-range in
+	 * occupied_mt makes the allocator visible to subsequent lookups. The
+	 * legacy free_mt stays in sync only at coarse points (init, pre-
+	 * perf_mode), which is harmless because the alloc and free hot paths
+	 * no longer query it.
+	 */
+	if (occupied_mt_supported()) {
+		if (!occupied_mt_find_hole_window_locked(vstart, vend - 1, size,
+							 align, &nva_start_addr))
+			return -ENOENT;
 
-		if (occupied_mt_find_hole_window_locked(vstart, vend - 1, size,
-							align, &candidate)) {
-			if (check_add_overflow(candidate, size, &nva_end_addr))
-				return -ERANGE;
+		if (check_add_overflow(nva_start_addr, size, &nva_end_addr))
+			return -ERANGE;
 
-			va = free_mt_find_enclose_range_locked(candidate, nva_end_addr);
-			if (likely(va)) {
-				nva_start_addr = candidate;
-				goto found;
-			}
+		if (!occupied_mt_store_range_locked(nva_start_addr, nva_end_addr))
+			return -ENOMEM;
 
-			occupied_mt_cache_gap_miss_locked(candidate, vend);
-		}
+		return nva_start_addr;
 	}
 
 	/*
-	 * Free maple index is authoritative for allocatable ranges; lazy and
-	 * retry entries are intentionally excluded from it.
+	 * Pre-perf_mode early boot fallback: walk free_mt linearly and use
+	 * va_clip to keep both indices coherent.
 	 */
+	if (align > PAGE_SIZE && (vend - vstart) != size) {
+		if (check_add_overflow(size, align - 1, &search_len))
+			return -ERANGE;
+	}
+
 	mas_set(&mas, vstart);
 	va = mas_find(&mas, vend - 1);
 	while (va) {
@@ -2295,7 +2314,6 @@ __alloc_vmap_area(unsigned long size, unsigned long align,
 	if (!va)
 		return -ENOENT;
 
-found:
 	ret = va_clip(va, nva_start_addr, size);
 	if (WARN_ON_ONCE(ret))
 		return ret;
@@ -2340,8 +2358,7 @@ static void free_vmap_area(struct vmap_area *va)
 		spin_unlock(&free_vmap_area_lock);
 		goto out_schedule_retry;
 	}
-	if (!reinsert_or_queue_vmap_area_locked(va))
-		queued_retry = true;
+	release_drained_vmap_area_locked(va);
 	spin_unlock(&free_vmap_area_lock);
 
 out_schedule_retry:
@@ -2692,15 +2709,13 @@ reclaim_list_global(struct list_head *head, bool erase_occupied,
 {
 	struct vmap_area *va, *n;
 	bool ok = true;
-	bool queue_retry_work = false;
+	LIST_HEAD(release);
 
 	if (list_empty(head))
 		return true;
 
 	spin_lock(&free_vmap_area_lock);
 	list_for_each_entry_safe(va, n, head, list) {
-		bool occupied_erased = false;
-
 		list_del_init(&va->list);
 		if (erase_occupied) {
 			if (WARN_ON_ONCE(!occupied_mt_erase_va_locked(va))) {
@@ -2708,24 +2723,21 @@ reclaim_list_global(struct list_head *head, bool erase_occupied,
 				ok = false;
 				continue;
 			}
-
-			occupied_erased = true;
-		}
-			if (WARN_ON_ONCE(!merge_or_add_vmap_area_free_locked(va))) {
-				if (occupied_erased &&
-				    WARN_ON_ONCE(!occupied_mt_store_va_locked(va))) {
-					retry_queue_add_va_locked(va);
-					queue_retry_work = true;
-					ok = false;
-					continue;
-				}
-				list_add_tail(&va->list, failed);
-				ok = false;
 		}
+		/*
+		 * Occupied-only design: there are no free vmap_area objects
+		 * any more. With the occupied marker erased, the range is
+		 * implicitly free (a gap in occupied_vmap_area_mt). Just
+		 * release the struct outside the lock.
+		 */
+		list_add_tail(&va->list, &release);
 	}
 	spin_unlock(&free_vmap_area_lock);
-	if (queue_retry_work)
-		schedule_work(&drain_vmap_work);
+
+	list_for_each_entry_safe(va, n, &release, list) {
+		list_del_init(&va->list);
+		kmem_cache_free(vmap_area_cachep, va);
+	}
 
 	return ok;
 }
@@ -5747,14 +5759,16 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 		orig_start = vas[area]->va_start;
 		orig_end = vas[area]->va_end;
 		if (occupied_mt_erase_va_locked(vas[area])) {
-			va = reinsert_or_queue_vmap_area_locked(vas[area]);
-			if (va)
-				kasan_release_vmalloc(orig_start, orig_end,
-						      va->va_start, va->va_end,
-						      KASAN_VMALLOC_PAGE_RANGE |
-						      KASAN_VMALLOC_TLB_FLUSH);
-			else
-				queued_retry = true;
+			/*
+			 * Reinsert releases vas[area] in the occupied-only
+			 * design; use orig_start/orig_end captured above for
+			 * the kasan release call rather than va->va_start.
+			 */
+			release_drained_vmap_area_locked(vas[area]);
+			kasan_release_vmalloc(orig_start, orig_end,
+					      orig_start, orig_end,
+					      KASAN_VMALLOC_PAGE_RANGE |
+					      KASAN_VMALLOC_TLB_FLUSH);
 		} else {
 			retry_queue_add_va_locked(vas[area]);
 			queued_retry = true;
@@ -5820,14 +5834,11 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 		orig_start = vas[area]->va_start;
 		orig_end = vas[area]->va_end;
 		if (occupied_mt_erase_va_locked(vas[area])) {
-			va = reinsert_or_queue_vmap_area_locked(vas[area]);
-			if (va)
-				kasan_release_vmalloc(orig_start, orig_end,
-						      va->va_start, va->va_end,
-						      KASAN_VMALLOC_PAGE_RANGE |
-						      KASAN_VMALLOC_TLB_FLUSH);
-			else
-				queued_retry = true;
+			release_drained_vmap_area_locked(vas[area]);
+			kasan_release_vmalloc(orig_start, orig_end,
+					      orig_start, orig_end,
+					      KASAN_VMALLOC_PAGE_RANGE |
+					      KASAN_VMALLOC_TLB_FLUSH);
 		} else {
 			retry_queue_add_va_locked(vas[area]);
 			queued_retry = true;
@@ -6045,6 +6056,14 @@ module_init(proc_vmalloc_init);
 
 #endif
 
+/*
+ * Pre-occupied-only design seeded the free index with placeholder VAs
+ * covering gaps between vmlist entries. This is preserved as the
+ * boot-time path that populates the legacy free_vmap_area_mt for any
+ * code that still queries it (notably pcpu_get_vm_areas). With
+ * occupied_vmap_area_mt authoritative, allocators on the hot path
+ * skip free_mt entirely.
+ */
 static void __init vmap_init_free_space(void)
 {
 	unsigned long vmap_start = 1;

-- 
2.34.1


