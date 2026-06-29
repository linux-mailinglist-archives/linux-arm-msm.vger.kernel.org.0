Return-Path: <linux-arm-msm+bounces-114949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EIcKINJDQmpW3AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:07:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9DE6D8AA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:07:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YsuC4+As;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NJrMGAgG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114949-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114949-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 054AE3075B5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE873FBB72;
	Mon, 29 Jun 2026 10:01:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478663FCB34
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727299; cv=none; b=t3iDu/uDOt6KJm5buZm8hRbQ8pgitC7SiXdSmAVWUoU6KTqr6joUrMzMKGdPXX8zr+4HzG7A/cAHHVekHHkjhct4sBvwdfCA92QRTdijBlGIGzPv0eDdMzNGbjaF+2ZBPH9Dj/cryrjuifIEq0OsTyj7DSCHN2QRWccutgaUJcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727299; c=relaxed/simple;
	bh=1Q+aPsoEc8W4PfEahFbzsFEdkzT9tiwxUCi1Nvr+Dts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kEXDXr0N01p84Q0GmpcpSB+9x8umkvXV/ZVw1gW0V8pXAjVdKUHrDi5P/Jdy/9UctPbFRqMdWXzxyoXdWCGBPfrwTvEngYuku78ZgfjyPj3SnA6jhZe7J4twsjGrGoPvEi3z3MbHuB1qkccIubPbPub7U6AF6Noh+zLinHB4KWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YsuC4+As; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJrMGAgG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aQ9I2368167
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=YsuC4+AsGHMSzIAn
	rmr/rPiVskzymkh+ff8DKRVStqcn57d70p3RmEs0cS3Soj8BYKxZOU1Y+g/mBQDr
	bIpaCcMTjYfPUnxTYQOyvMoCautmlkbac/MTiWh4lgs6AkBVJJ4j6HIZGz9HKQkc
	hxiQ4EgCRuV9rTR+tk4ul/j0JRkDcdCcvVvyF/Ptc9AWeBdD2wPlxzbFpuCu6Ikg
	99m3qb6WtQU82vbJubQeIgfAgMVHm5+UwhHV5MAQqD0JviBmiww8pDMjU2WNWhXZ
	9y/tJ3rwT6QveCqv+yblwCeKTuJROm8bBCqCC0jwqIjkESM/RhJddr3JbVIPYWoa
	LQt/WA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrba1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:37 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4856ecace68so2033990b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727297; x=1783332097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=NJrMGAgG53xwTczL9iM9Slv9TCyFRlfHBAZGkH69B22cCaQgi2JusIA9EX1oPjtZwc
         k7fUcyUOVJIFZ+vUZWcO5OUfw/HNXmytp/qAB3iDG7RXIty8rmtT2Nz2CwjsgMjO91Ff
         BYTWbBOtxmRHhYvFp0jTQWD3X72ua2Dev38BZhm3NxWJG2Lv/1eaWp7nheIRoKfiADSK
         pmh8OgBXecxZYi0NEcoPOkpC57g4sUe0IxQ4/gy1Z3rD8MJ+TuUJuSQFTf4guLAWZnPy
         Mcqd4fHOclCdJ6DzxAfqzyCvm9nT0Q57K1outoIF1qDFbRYmmVavYYAaiVfR293++e1w
         IGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727297; x=1783332097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=bpE5EC+kludmz4Mj5W6UMhyfnt+lbHJ1jBPY3oNolY847bjTMCSw0guA/rGzMF+I9M
         +fbBbv0ZLLn9hNMETgLX/EiP/2zH7rn3Gz0POdMkOM5sEQt/xdS1Ucv/zAvEU05t/Pm2
         VB2rmc0WtW+uFWMqOYXMlRLiJ7Lgu2RWrcGiAA87ctXXXEg2NOuoztDNUBt7EeJ48azR
         E5u8qvQB40B1AdDd1wa9OXAqhIVXo/rjNEwewU8QMGWWdlJoOI4OqCOCMpS99Ev4Iwhk
         8NNn63SUmq8BnzwyaFXECWVFR9zuIZDjpxYDKtAdpLZscMTGt8t0WM+ekDoQV1z+t6Gz
         XC9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8dOhXTeaMGk3E/UFwG3d9CAWZBlF95ocuL4TnNjOqKGTzajkNVJ79OxnvJSmsy/irI7dGJh+hzYeB//Shj@vger.kernel.org
X-Gm-Message-State: AOJu0YxBkL1W6S4zzAXF/LrditYDQChISOSP3aNY9sMQuJXIgSZXr6sh
	xrC1GBUgqidRgYTetnzpy5Zj/w4wuXONaHxvetryvzgQQXjLtIqwF2GJO8bW0Xg46+DUmpCHf1I
	pQMhSJOtfXbTBlQ/Yl4EhLj3tGZESy8PG+JoF1z+sfsQH6/gRwTReUk+99oRN3EdVgK/5
X-Gm-Gg: AfdE7cluANB7A25ND3KcFNqEam9bRmcQfjsCIifWtlPhGxixfP4v6SA+fpU4LafqNKJ
	Z6tuQwgqrv2RT041/kJC4rF22ZLAhXYtmLYnOKo0YuMvjDfA+enRcPdpq0H/Ly/lygA+W+afZqH
	4w8h1SORCKHr7C7PK4CBK3g1GITgZMH4e5o67SXf3VzKTSyk+N3vZ3iHfoPvmQVf/PuY82N4HQx
	C9KZfdy2eLthqMUYxs6dRZaHDkQzdmtKlX2dIEpsCujQPwPYyusAZpmTPRhVnMIG4pbGTwxaZHe
	odeiFo0YtLSymF0xAraehk9/aw23DRMjz0U96qkYvHABLvmBeBB6RbFZebdA9Ent4P9XVG8sBR+
	YjmXLfkyzX5GVMpubM6sDSKiTSiJek2Q+iX2LwaDX
X-Received: by 2002:a05:6808:1b1f:b0:495:97ef:b41e with SMTP id 5614622812f47-49597ff0929mr4551663b6e.34.1782727296621;
        Mon, 29 Jun 2026 03:01:36 -0700 (PDT)
X-Received: by 2002:a05:6808:1b1f:b0:495:97ef:b41e with SMTP id 5614622812f47-49597ff0929mr4551638b6e.34.1782727296160;
        Mon, 29 Jun 2026 03:01:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:06 +0200
Subject: [PATCH v20 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-4-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HGeQqzQf8+DrUa/4bzOvLohFWS/bDVC1MPHUwVaBFAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJrR7CPyvsenTdz66zDbeFqHDDGugXN3lznr
 16tzveSf+CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCawAKCRAFnS7L/zaE
 wwEjEAC8BxDeqzVB/FiSqLfBuyiSc+udm/QP7Ano2F2ABRLcPRibEPFFMP143fGC/RYY5oZnqZs
 2zGG48hkxWC8orAZJOotoGULoSVZ19Qe5vl4VAR0VjePneRaJT99/ZULnjxoIa3S+vGybMQ+mlG
 r9xiv7hfIJjGSua7ta5/jpQfMQ5mNPETs7dJlt7qq6nHwXjpBAfUqBgSDOjt1rVwh1mLejS5pT7
 sl1t9rcTsEuToWf3tQNMvKPofcj/P4wYiMbzt8CpM+1p/zmzjBwFGDw7i+EUnCXle5c1ldKMI7n
 pg3ZfKNmJrNfZ7HQYcvTORv7MSg+5GU7+dDIyQFUnk/71l+X1wKX63j4yGN9OPxaWhWZIT90qI2
 rUFGFQVLZeaSeuYHJJgiUxVVX2nwDwPD6FMlMTPQRcxDds15S2stZJujuBmZEPn/q9dzJoEBNDK
 YKkd9eYKai5OtBCZhZmB/Rw2cEk1kaTTXJqyI0zGv4P49wV1Aetqj134wzGm1fWLfGyqqxJLeps
 pAPqGI//pu3o+2ciKnLMJOBkJWMd015L7YaLrUOtK+zUqeIM6vrJfZGzipYm9Budf5x+xe9s4ms
 YRZWUKzVyLxTzMJXRaOoXa3CZcP1DbNFXAaSBUoOTQm5fxh26q7UVxpS6s0fNNv6NrhQ6eHePEZ
 zLyKdIitZ3HAvxg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: w5Ldhe9KFuT-xfkoDxyZZIbQ7eX_PJBD
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a424281 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ioP1PY9e4_dTeLeN8ycA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX41npziGNAl19
 GKSSFw5slysjY8gkJ4slhsaATsTGyk6l/7S2maiRT7X3eo3886hb4XZADJ+W50J2KV15Q/1eqdo
 NQcTFKIHjdrWAfTZg1wOJI3wdiUhVxU=
X-Proofpoint-GUID: w5Ldhe9KFuT-xfkoDxyZZIbQ7eX_PJBD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXxgaKKFxi20YZ
 IFRVi5F/RC8vk8aNGf4uhWEfRZs00IxM3togxxpW9ElaGPkgCuLlVyPDRKSvf01m2JvUjFx8/KQ
 mcesvxDgCkqlEapiX8XVKRZ6mCx5cIApO40gxhouRxpsrHafqpmH4XTvgYLixzL61WMaYkO4EFk
 NNE6J/PX/4chFo4roAmNCPZpljdfuepVmdo1uKRErgGiotNVmusTz592VaxJji4SlDGghpLlXok
 Xtq7hs1p6mgYF038hItZudoox6Pnu2H9Jb6DhbuGzY5dKWFld9ZUzcrmoUH9Wh9/QhVi98xhgKe
 QjpPNu/EoFNF8JZK1CpCYH/u5w/PefDDfsZ3DjsGVd59l0NL5QIOJGhte54exp8cMqBOreDYsTy
 2NY1RGednUDGt7vyE/6q1XWIJ9yWUGzPoxyWPfBjCDRBoDkQ/GD52umh5W6pEC8W58yGIZxugUH
 593/IpYAe5VoGxMM1Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114949-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,linaro.org:email,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: DA9DE6D8AA5

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index ea3df28e777f99c0532761b6aee6807ab23ab4ca..8ce0fe085c5fea6cc614edd692b5cfd264b94d5a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -113,6 +113,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
@@ -229,6 +245,10 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v2_0_data = {
+	.reg_info = bam_v2_0_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -422,7 +442,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -440,7 +460,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1234,10 +1254,10 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
-	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_data },
 	{}
 };
 
@@ -1261,7 +1281,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


