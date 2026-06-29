Return-Path: <linux-arm-msm+bounces-114921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id poPOCNA6QmpP2QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:28:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDBB6D834B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:28:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bnbHwr2m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kVK43nVz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114921-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114921-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3221D301F6BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F9840587D;
	Mon, 29 Jun 2026 09:13:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027A63FBEAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724426; cv=none; b=AXVJ+iV19H7wrfIAX/7F14+7XPkdiiK593qK7yk9+3+nOkbTuOPRYFMtbn94CQxnUhHLMeG+CQBsjxDavjfSiwXhkWiIMdv+yZhtip6BGBFojMiweSOQLOqSRdJ0YSsVMCcrh+nYWSyok9/6SJJnBfEK5TnoyDBt4COi+h7g58U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724426; c=relaxed/simple;
	bh=AwfZgG77y5F6PYl9qwo0/ZCBmtiBmspJvlFnU9x6+ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MgISRvHJUvgYJB9+Qe2xHcj26Pu5GHMxS4BkDfki37sUBaQ3O1trwXAL/eqpP9hf55uGd2ZGzCmmYicAmYEVELrhTbSvVLNxrlRNhEMH1cUNYRO1xKvEwkjkF2XPt5OlNSH4mjLLUzd0qttqT1EJqVnrZP+jLeCq76MeataT7WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnbHwr2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVK43nVz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7DqBW2188823
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6nG1Sji42mne2H5wEre1safG9ubwm9+aubw7cimzGYY=; b=bnbHwr2mSRvwhRpY
	T5Fs/qtEPzfnJLoght+lyWjGjZdvsT/Du0by+WEYqMVeHRDStN7RWrbgCO7nPrGl
	M4aulqBeZTNlOK5/1DeV1aK4ffO+kHFYu7AUE3fGhK1+vFuCQ0/sM/kwwaW2xqV+
	dWsjyBGlqaDnSMZWllZdExjlEdI0DJ4t27Zzl0aNRhQH/e6UCLRcq2r7o1F+fSf5
	Cw/VIWryBIdPMFR3FBA1V6fvHP1Fmt4SiKCh12fivPyC5XxkEec1HH71tp12j1J+
	e9YsdRmlxaAHZHhxnxkan14UOGA+daqp//l3w2pRTzBT4kUgmwyw903LhzSYcqG4
	Pi01cQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trg7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:13:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92229624a71so571651985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724422; x=1783329222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nG1Sji42mne2H5wEre1safG9ubwm9+aubw7cimzGYY=;
        b=kVK43nVz3Mh4ntlNFeyBCxUt4Gl41YH0GjmR0Gz6GNSDi0gr8js1kQk6JK+dWcemwj
         nW26Y58cxiSbBwsMjfsd5nC+BnSU7lD6SClBMkoSpzlb5abeWljVimCLaQut1WZTsFuN
         6bekvs9En3Ge+UQgHPa0sNZnkq6j0LymNe08sH27CKJCHtNAtFEaTsrVoEO6Z8a75I7y
         CJM/o4AuZpIGknu1AGE5w/dUSY7tQik6BRQZkJKypUqtju26wkp6jx8sWrnVxjEqw9hq
         diokWznMKljrs4MG7kZbaWSeEb4iYIeBizdjShycmdycLTyZT8epokBwCua/0Mo526Km
         WQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724422; x=1783329222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6nG1Sji42mne2H5wEre1safG9ubwm9+aubw7cimzGYY=;
        b=GCPBQ1d7m4MZNTf1/CfwgbqiE2MZxlgMsvWtAjgLT1vMfvV77is9mdDCOvgX6TJXwl
         mgPb4UkAn+4PmBHWv+9XsXJhmiOg7RqniWeyjpbpgi6ad6njlW2qrhjy9WhF4nScdBHR
         xYV1ebJ+scAxlOG3x19O/MmN8dN9yDINgBF6F6uzWqGSLK5rwqiLlEg6/NmDW7+4IjF+
         R1bsBtgfZITtehwdYvb3Ktc/cbM5XI9dpLsuWEBKN7hTOhhnfFgQzoOOQeTgwWW7io5i
         LP/NcAnmUsodRL3gcm1FVOdib95zgtUWRBEqRuQsOVGyW8NQ5BDz3fkmwy+7lyWVL3gX
         VPOQ==
X-Forwarded-Encrypted: i=1; AFNElJ92vi94EO4JqDvlksYlaAZlZVVLFfbD3Wj38BROeRNjuHbvML8i2Ytso25ZN/BpKjbYa5pBpZVhHP9YHPcF@vger.kernel.org
X-Gm-Message-State: AOJu0YyLDwp6dGwnMQZZFB2z+xe6qGieqFFjLP6vXfCq6FNFO8MHX6qD
	/GeMLJRaLJzeLdJDVKoArRF9Sgng1oYVnhme6vKRlgSFYaamNLMEY7Aan59V/ZsqIyQ/VvUizfM
	rRktZn2n7wfnIhyDJRs5+w/PnQvdFvXThbexAvrZGqPoY18xuv4a5oa3/ZTVgTa/VNiE0
X-Gm-Gg: AfdE7cnb3bKEuGwrEWCTF02p6A/ceB16wF1y4h2jn6+7gnQ6cD/lDQCUJQUkoY8RmY1
	k22iASCMwhOyC7ooRozntktl3njkU8/Wt0JnJO4mWhIVjep7S3SD7RsXfXJd4uOmvywAXrjw6zs
	450NjxPH3+wrh/yV5dMw1sHvVr7mL68wrqQ2+CUWJ93kut5E14/h/nGzrWIp+rrLTnnaDWexrxg
	yYEST8WtQRol6uhuWnvf7n6/HcTM4gBYJ8Dfeeifgtw7xranQzDG2h64+a+ZQow6De1ky8FxMxm
	faZNJc+AUUeVNbRoqowoPxhbleiSVN5e0sa5nsW6noJXwiccj9hW2bW8n5ZkzFsErkVUlIij9Wt
	BSo1H9eBSKpxGp/57H87G0mTmdbVqbEMTtFCuf3lk
X-Received: by 2002:a05:620a:26a8:b0:914:c226:ece1 with SMTP id af79cd13be357-9293a8a9a21mr2392763485a.13.1782724422210;
        Mon, 29 Jun 2026 02:13:42 -0700 (PDT)
X-Received: by 2002:a05:620a:26a8:b0:914:c226:ece1 with SMTP id af79cd13be357-9293a8a9a21mr2392754885a.13.1782724421604;
        Mon, 29 Jun 2026 02:13:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:37 +0200
Subject: [PATCH v2 14/19] drm/xe/i2c: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-14-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AwfZgG77y5F6PYl9qwo0/ZCBmtiBmspJvlFnU9x6+ng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcSMKdRKoFVH1MgLNJk3NI477IXVrggM2yrf
 qWMIi3XU0CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3EgAKCRAFnS7L/zaE
 w85gD/9rbl5AkgwjwdNiBcra1438gWnkZ4eAmKSEAAJXU7zcuofXfASHZOd6zPIW+DrV9r1TlxD
 KP0DeIAOqZ20FbPa4NyxJsz30Xni9oH087pgaDFHuDULWlH807p4z5IAByNWwQO401AUTRLZEDh
 pvULOi595BAoeJMAXJniO09FF8cacJPctOpdYnHd55I9oOmtmKFTxrnCVZIsIsYPqaZdiZADWPR
 MaMoJz6zjDB1IFO0JGZAdHalp2rAkmTTrhr0WgrQx1c2MoTAB9hTqKuVrkc89Jc5wP5ebIgPsuD
 qFljQKN6317Sh2FiMmSKEKGVCihn0H/EGe1vz7oCAE5DFhyZ8ofFKPx85kRbjBbmqg8gHi7KbrN
 lyej/lWRwzx48gMqGXqbW/DIlRjdBRiKolImRNHlpBCy79YAgtKvC2CuWTrZaRq9+1po/RT67Tf
 nqTjAXj4XXZKLtNGgDAu+Ifc36Grr7zKcD0+2sIZD8B+aUjQYuPfQxJOzYZqB2zfNsFGxhjQweL
 RBLurhlNBBwIH6X1Pyzwfheudxf8HN3m/QyOHbct5Z6O0IJ7n8oG7Ed4pHsw7m48/K4pPMB5ViE
 G5xtCnPpLGA+nNR7tqS+s3DrKKnkQo0eMI5JgGcUj+jVUodDfAKTd0dDBasosoFU72LcyzV/dVj
 ZVn6U4/QQLq78kw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX7wr7QoBZbXVN
 eQhEo8IphuirmY27WUdDTyvqvlooloaFCqeknASgJ97XMmXWB9XR4af1r8ytiByIZRH3WlsGn3O
 5XvUbuuVj2/0p73jn7otC3YtL10otn74MBrs+VDFECSGTzLkvVo3rEOeCOg9LIqYH7v+1p+MijY
 t2CSHl+hBCZvaudps32qyN/asgj5bWbitl9ZuTLqfHZ80P+jzKNzbVaiKP4igtLvGqYFZ8cx0ZU
 ajaaG/DOUPFkGliG8I4V742TxihjlMIjdVoS7N/gI0PAHF2O9Ez65fLD3YYGCwaBZ3x2APRSTUz
 g7newkj/AEdrOENU6YogR6qXU+BiS6d3ptwjs66iNq+D6cIErOfsmrcTm9iS1qVh+ViPflF/yT0
 oY90sls9PcEIzyrSJfg97QlYM26GwNh7XvuEqbR6qCKaMGBVEPib0QpnBf3ObRYGfi2zvOl6CxE
 Mk1LwtTrOvE18w4iJFQ==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a423747 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX/banpslOy4KB
 K4H07Ueov5Q1WZvCgGqjt4hP+pqtT64SCYUTb8Qw5rpNDTo8TCaQxPrWPDcZFqPt9RYJsMvmaF/
 NLjUvklYmAvO2ea9XTETCe/Ow0VNrEo=
X-Proofpoint-ORIG-GUID: EOUIcILP4eBA_KNw3HPr7SySAMjoZ1Qn
X-Proofpoint-GUID: EOUIcILP4eBA_KNw3HPr7SySAMjoZ1Qn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114921-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FDBB6D834B

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 706783863d07d66b4685005d6649b3cd143ecc3b..af4ebd93ad8e68c95a14cdf99de0959fbe080354 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -123,7 +123,7 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	}
 
 	pdev->dev.parent = i2c->drm_dev;
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 	i2c->adapter_node = fwnode;
 	i2c->pdev = pdev;
 

-- 
2.47.3


