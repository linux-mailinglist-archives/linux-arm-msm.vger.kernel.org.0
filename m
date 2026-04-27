Return-Path: <linux-arm-msm+bounces-104659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKazFT0q72lE8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:19:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FADA46FC48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB0193001F92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8265F3B47D5;
	Mon, 27 Apr 2026 09:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqjECPOQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bRvrOR/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C243B27FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281378; cv=none; b=WciYJ84ptz328csJ7ZsfsKoigVQUasH0UUAMdJCrrcdDqmwP1+SP3aHC9UK86tZCkMqeNFTF5OrnGoczcBdI2YUM0hnEe5DnRk5L+TAij3zRYvX7+zvYbnvIJ9A+Sx25OtuCOI++YWzlohVE0Pd/cn8zycnF/cLMSGbyZcbfgNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281378; c=relaxed/simple;
	bh=H6RGZzI1m6Hy642I73fornlozWd6x9hkPKo2H6raYsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWUJqZANe0CzHaWFoHS0eFu66h6T3nr1g0o8pt2jjgwOz1Y7HTbnVmL6hsgjd43FbSl2irl2HKhRBg0/94NFGEfe8Ga/XukSrMWA3FZm8jgRLSEcVhnYaT8mk9SUEsKlzxNxaWPDLX63jGifyf5/Vg8XOf/vP2N3GBakS/nPvvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqjECPOQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRvrOR/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBS1665673
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=cqjECPOQBhgp/xal
	uuHwTLcClDvcuPKjvo4pdqq3w4WLLXHo+18z2NvIlf5MahPhuSE/gacEw2ZSJQRR
	6gdhKiDFOdkqIehtZunjo3pHI0oDXyQMqjmZ/e927XPUVSNPkMCU7Fzxr3ufnqe2
	jFcM7hL3QtHlbvT91hKKBKkHGWu0SZ/PAtKG43B/NW6V4EaSiIjhkqzf0nCXesfK
	Wb4UDUvt7xV7xk5ML+lkbQ5P87apMMg/NksrNyJX9KsUEZJ+9nwpYzkLkXQ1skAP
	/KPodTh3wDjVnAJz3P38Pd4i601f+gVeKtx803pwf9IDx7/61nJ/bnRzUUgJdFTI
	uT2p6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0kwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d4c2906fdfso1025338785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281375; x=1777886175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=bRvrOR/uQFKPPdX36qoRYg/j+FDzcs4am8e033i/uVRwhlwPpPtJBszEQ2mFOm1Xli
         U08fd1SmNsa8KWcA06XAyvOlk056J6HCHoLhrIPXys2qRsq3PWyawRTwg1RcxMt2VKCf
         NDlj5WuKUxoIN0GSv8XAylkt+qU5BBgazC7Nz/bcQ7YPsWv2bEaCM9Bx6EFok9FwRKbJ
         pH5ZzCO7l7RDrkmn+ebokAGYktovCCIl0n939Hez2rhgXS+fPJt+KeNjlDDJ/3J9zr3H
         OagQ3ZUTR6jrWeRUniSrtYUAYqX/LRblM5a91QgWSTAd7gl5RTzTDMlj0MPqFnFribYI
         hvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281375; x=1777886175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=VB0NlWdYibCSbA0467445PyMqk11QoLrh+7TpQUYkawowFUBHPZRimrw4Y5mm8flgA
         rRDCpvpoIywIPpQRjgmNVVZusF9jN8sdi5HOGEdLejCb2+++XEpBoTFbpk9Kt/bYbVMI
         VBb2Ut6lYtZJ41RzDzwY1Zml5TIl/UTjWyYzc5kyb4FL9PuCLjtaIR/CKVN2a965blFI
         3WUwgyaBGMgc60Fxioeo7Itz7E7uLxGV5znwpyDu1n7+M+4iQz6SrI3Epxll6AW8sVmL
         OXF7Nx3Kiv17PlKSV/6ObHEFayBq56YsQ0bW9JFuDquJt8Z5nPhYZ1ixm5R0JebcLRmv
         IMoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v6QIpHLVgSmst4CzNOGEi3aBxMVIOUXDy+h/930X4VgCO8i+r8a9rgfHyju05won0DGtk6pZkwLdCs93b@vger.kernel.org
X-Gm-Message-State: AOJu0YyExdsLBZABjUhjxFPcoOBhuLs9xpGHXspOWysIJYRffcj7yJ7d
	JXoto3Z/ONgE+TdURH1uTK12HOFku/yJaAYeOHbbE3G6p/o7xfnAvrQI+oYrNzpbQO/E7KGdXM6
	rdh0G7snG1jMG4sQd6gWzfSA998RKHM+28oyVXHP3U9D7Xciesn3J+W+KSSMAT1bBC1Hy
X-Gm-Gg: AeBDiesWjLoRgAyD1mUlyQp3aDPQ1k/0r31oWV+qH99nHetX2HMHESW5CDyuBQ7VOeB
	Y2ANZSznfKGlGGDHMnXCdk1SegFWdSVNhrgsac7TBnkZr58apvy1544oAotaZKC7ItkYPVMpwJ2
	QCJ+eTWcBcYtREygE6NvcvDGd0Yjv+tUwRMZLsCSr683yDgO5oJkD0OgvmjIwYK3qI+OyVhHZWk
	Ya7hfvx0vaKFVaTtOvbPF2bblOe54F2QcLI/4wfq3mX3AbeC4Mvty75GsY7YeAErZFRvdtU1qNc
	hHf+qyopmsaCuzgnujljFL6QpOhG4HdulmIg5t2EO2FhJNmvTTDlI0WnEGK8/z/3KLvuSn/2k6+
	eQvTQ9TUk4pCP/k8TrP/qET3tnpExuFuVp9YM5EfBaos2M2dQfuN3QI0KfIQBaw==
X-Received: by 2002:ac8:5f4e:0:b0:50b:5056:fcc4 with SMTP id d75a77b69052e-50e367fe796mr649757821cf.4.1777281375239;
        Mon, 27 Apr 2026 02:16:15 -0700 (PDT)
X-Received: by 2002:ac8:5f4e:0:b0:50b:5056:fcc4 with SMTP id d75a77b69052e-50e367fe796mr649757311cf.4.1777281374731;
        Mon, 27 Apr 2026 02:16:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:41 +0200
Subject: [PATCH v16 08/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-8-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TfRVgyaOMZw2GJQ0rx6WhRl0huHGm4mvuAmz76BcVUM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylEQkBhfE2gADseHBpneI75TXF7a2W4RqCZO
 UVezU0cEJuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pRAAKCRAFnS7L/zaE
 w+ITEACxbn5lhWiDiA22lakYAcGbPiPdloTEg9NsX4hB7+zQweJ2BKQ44w1ptY3J/fkSyYhHE1b
 VDD+3mq4jShPWTj29HhzHhHaRone/BLUmgfswv+pvMD2jnyX1VeAbb3y+uUSRVIAWHqXjTZgEAg
 QAqnzxUyHtIhVJrz/q59A2176m8ZxsXboa3p2aiEO1HKQJOlGa+McDuNpz2nIcb4pt2OmjKugZq
 MNBkXuCcrWp6ApU0KTSgzn+1qhrfb/xT5eNfFdK4cHvTSC5TowMB+v4XftQ0Ph+pK9ajt2udYDN
 dBkWaoivuAAfj7rakf9E14msoeLGihUWaYlqhZemDplPDWyF72i9TcxVIdItOGSbVi9CkIjpHeh
 fkqV92BSQjGTQ+SX+geWnA6JTdLq6zj0ndO1vjkpOzlL2jcWRFkaMFkFfOQwht2uP+Z5T9SmsHV
 pL7SIoheRcKEnrZyzLJwH2OPKbOVsegVUSPBX6lEbonu9Tfd3f7VHjcdkN5lSR+MSedxi+O34kI
 CfIiqO3ueachpEuE8Qomk7U5gd0gKhpwm4+imM2xbYz+7ef/YPSc1prbh9GWZ9KjzLBGgzJDbOa
 isAJmwUL+2/o2d/01i/76RMn7M2ZxG4iEw+3tzW9/hD62Hf3LzA1RDUSyttDTAH56g/sUe08dD6
 +edq9r4HES1frQg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfXzPoxtEPRu8xE
 rNp7Hi/WwZT8BeVx4G/vobnVnu9QRhWoeEkCvKTOkLxYoqXlbMReXfY1WH8Bx1JPdXRFBtzv8xD
 x5BAnhKIMQVsgE9LxSmwHLQFr7SJRUfmlPlGhhq7o+TXjeNUGE0drqbu6TK5oluc9f0HSfU2axD
 0SjMT3z1RbEGMuCifYXdCltr6XKBdEOOzKPWuoKvVK5U5/DtpJXLkiMSm2DjFyVXgpbn56DYcMG
 oqD8jXRO/STK0jhoNCr17hjSI+aEXwRaiMN+Uw1pBiYRl03VndeESmSAcu0o+0ImTnPW/plFfJc
 uPDJI0w6qyVrpd9TUz2sBarBJKiVYRdXpHATEwf1oRzEQjcwotVoghpnZu1GBXqEIJ1jUiPdMXC
 qmlRZaSnuWVM6k1u1QdPGsBoDxPYaB3ElsNFOVdGUHekNxXdB74meJ7f5FXRpvkN97m4TSWt6Te
 eK/gg/lDJZNggVjYZjA==
X-Proofpoint-GUID: vLj1B9c-MUgpEQfMUqOeEYG2UEnr5p_R
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef2960 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vLj1B9c-MUgpEQfMUqOeEYG2UEnr5p_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270098
X-Rspamd-Queue-Id: 5FADA46FC48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104659-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 65205100c3df961ffaa4b7bc9e217e8d3e08ed57..8b7bcd0c420c45caf8b29e5455e0f384fd5c5616 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -226,7 +226,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3


