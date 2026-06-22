Return-Path: <linux-arm-msm+bounces-113996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dQ2ZFX42OWqRogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:19:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B99D16AFC3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:19:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IPb+uo6G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GfPrICT+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113996-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113996-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0C9D301917C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375113B3C17;
	Mon, 22 Jun 2026 13:18:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE313B3899
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134317; cv=none; b=KmU6gjTbXbF0ta61hLxZ/EwiNf1S8/gNFLgPyi+wnwE1p2GQ1HwRUYBG7E/ng2bnH5vuI4dlC105Vm9GxeDWQysZqlMo81F8six0oEz98dNBMNuqcs5LSmnCQFwSvyvjskgg4nZt8Bk6+Z4uiZzGpsO/Xtemm+/P+8Ia8A8l+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134317; c=relaxed/simple;
	bh=9/13CghT8FUQYhvJkIMfRdaeEEFUpDm37ejb6o7zYGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CsyfDUjye2omBIKZ23ax2J8oSaQhatb+45qgfVDSpXX7/tW7A0WxYjLKnemwhAJfeMbNJatyxphViFJG1gZu6krz3ZJ9/LQ8USaVclXfs0q0PMdN4WTAvZTFj/Ce+ucwaJQK2yHPqkleXidXwzTXtS6Pk/vGeitZa7BGpQbzxms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPb+uo6G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfPrICT+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFvxS1061110
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnoPkC2GxOfpsWV0NzbQHKvX8CiuSzxebCt7oRE9BIM=; b=IPb+uo6GI16w99hQ
	fHW2TrtLjKX/fVWztx57XD6gdstVZ7ZXWfBzJRquyCv/s+sdvUdSLu9vc//4v88p
	ouA1uPEwxL9dHLab7/b7ArzDV9n1efs92GUPGvH6RK/V9xPnzIelcDpodqzJ/d8H
	vtdsbM7+S6nvH7tYQbngXVyrdmYVebm5lvtRpecxMKMsPotpQuKHyr7QEEL7Wr4/
	M8Mc2uOXLB0/ijLRjBlEFf4cA02thJm8xlEtjAoQCSB1AALO05uJnNjfrQ+a9ex1
	l89jDr/LZPMSwOI8ckdXaEBvULADKV1l/bsirHC1H9IAnBJfdHAobo4gojBT8ZAN
	pDkzmQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1sn5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-72d089b28e8so1006448137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134314; x=1782739114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnoPkC2GxOfpsWV0NzbQHKvX8CiuSzxebCt7oRE9BIM=;
        b=GfPrICT+D40VMU2mN3vb26p4qryVU6QHN+byPTb+XSZMg/l/I2/nr9hjqWhbAa2pz9
         yFAv6YuVRmSpTiedfWxTYq8/nsYcPSvIZPO94pp0K7iHIZlPJbM/hj4y8lAQ+ZE5A67v
         IXuS3QUo1YscgpynZG0w8+Cd9Fe7ed8EJViyU1sSZZwk8IzvyrHPfr0wWBkg7tlCORW9
         z4NpwVl3STx48ysOzx1mCGBTX/VJLsezJQVIYxI1FUQt8H2IMDtNIkhdoaBMDBcJqWJl
         MtYUfh6SI7LWlGltYKMzOQncXIIPknm32emuooHVIHG7shDEZ2uoHKuNfp4NeB5G08JH
         x74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134314; x=1782739114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fnoPkC2GxOfpsWV0NzbQHKvX8CiuSzxebCt7oRE9BIM=;
        b=Suysj6KW5BQR7NYQmDG0VEUnjX6uw6Dm4vJZKJmfmED5TxVNBBehcmo4n9i528NZh7
         mqxCEDvNIs7F7Gn0xbkagXoVEuW3vkrJgopqHPxF+xcKtdL466OgwTcvknMsgZq1W0KJ
         IkKhXGilGLFFhWAFLJokzoejqpXwyMF4HzApP5iN65n7bd/5x3YDnoDi8LRboX003OCz
         2kmHFJyBUZ5gU0+/vvUyB9eiZe6MmtdkaLPiew5yKOWZPMsLvVOmis8xe8ipVIdtfmbD
         ZpHZUDb2EESVUxh6IXzhyHXcCTqUmu65H1urq9rj5QVLGAvv38BBEi5sLQfY1sextzc8
         vHgw==
X-Forwarded-Encrypted: i=1; AFNElJ950N/B8DeKlbRgPMf+OgUNiilp1Z9kSHb7yzQauguvCBlHnRF62ixj4wojHVEFhr4y9ETF2nhlpG+nOpcp@vger.kernel.org
X-Gm-Message-State: AOJu0YzvZJs98Fd9S/S9h/UJnmPEb4Tz1ExybTgC2ojVyBAxIe89DwV3
	FY3t/IlDDyaitFSuKcaqiOmp0PZiKXOwflHh78O1GywKYrH+ZY+/b7kp76O8zgCLCEijX5fIJ/J
	O+PV3Wy7LHjDWvlzaSoyeg6/UbXtswchJMD6pYC65ZjbkUKarOyFSLghdqqGeykOcAAlf
X-Gm-Gg: AfdE7cmv6HI7Gijuu0yd8zsj54NZ5LXaD+ZUic21se8Zku8IiwGPzPU8qbnlm4fA+If
	fZ6sZICGrHMR7E70F6vos0b7d2nM1rY0MbiRl1MnxBEVJ5z2Y8Pa//Wd4Xv9y3s3E43rdANjX4r
	knwiFpRgsOgj7r8gomntV0La2dwd3I9I+QWp33Pr89s8SrEzs4dvLsn/wIAXG9kmWpz1PUvPKu4
	oelNsY8/Z+ESBhRXMIu8/UAHLJF8sUMTEOL+SPebhaWA79m+nLxIHOz2DO6cbPjQt5Fc8V2Jwfi
	MoaFcuwUtjkjcwtFLFyJcH/BUKCPvgA3blbgELDjVo50cf33aNmC9xP56bGTadJd8BxIDJJvKsP
	pVCDtKlc4vw2OhH3MwoSd5pd66NENvaZ0PjlsBiVO
X-Received: by 2002:a05:6102:1622:b0:728:4383:c831 with SMTP id ada2fe7eead31-72a1d634920mr6736258137.10.1782134313884;
        Mon, 22 Jun 2026 06:18:33 -0700 (PDT)
X-Received: by 2002:a05:6102:1622:b0:728:4383:c831 with SMTP id ada2fe7eead31-72a1d634920mr6736221137.10.1782134313271;
        Mon, 22 Jun 2026 06:18:33 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm294083835e9.7.2026.06.22.06.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:18:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:18:10 +0200
Subject: [PATCH v4 2/8] crypto: qce - Fix HMAC self-test failures for empty
 messages
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-qce-fix-self-tests-v4-2-4f82ffa716c6@oss.qualcomm.com>
References: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
In-Reply-To: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9/13CghT8FUQYhvJkIMfRdaeEEFUpDm37ejb6o7zYGk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOTYcrgYNNRo2vnWpL+O5zYRoZ21faltuUsACO
 K6MsYd8vyCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk2HAAKCRAFnS7L/zaE
 w5+GEACKCvApmJGwQG9zedV5phOxVMmVgoa4r0sqeSooXr1rmXObQTno+ME6/E4VMxUnz+FjR1L
 aO1qgcgOc56gd/i89/sJbiuSlB3InVdt76JOJKSFHdzoXPyXGStiH+9pr8jhbHX6j+i8KBl6GYB
 rT/Yi7zC3dsktyC5J5yiEIVUmF9Jrunqp585s0qFVYKgrBtTcf2fE/e7WySEBG4b9tH/+neInct
 FOO/0mutCjOOgZD+qNlTMKUFv1sYYBPxDLeg/1G7cACgtKFaHtKS3BEKg8euUg/pMIXw6/27mLv
 upXda56G5kWah5msrzm+MM8TV0RLFhx+cy8POaqgOaWcr+LYVioFQBW/PjBysEdxhr2Dc9W34b6
 wNcrVNcI7TAkl+Ttf0D1wgfccaY00D184OUHT3U94gVUWiLnRBOr5ok8G7PUSeGtpvbBqU88xj8
 oHpeEOmCHXGc5Ir8h8TX7jI/FYR0dZPwbxJhMAF1+E8UprA5x42yrKnUf3jtcaAb/GIJpNoW7X8
 L37K9rSlVM/rkFkhdK7QHczcRobGSifrL5UEhk0rBWTlCHQeuhP6MBXqhLIb/wE5pVmN6wPfSxp
 koTlcUVppexYE5xW5wO5U9keKDfmgrv6hzgqud+MapEbaqZy4I5VERUfqQ2VOqol8MdxQ0Pjq8x
 EyAYmps4rXdV8CQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: c8Rq2NWbJHeo0gTHG-S9Rj2x9mtzNDDo
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a39362a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=p9FZT9qupOX1he3wxJcA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfXxMKNduPWFa0s
 OLqT9XUmZiepQmb3gD72WNexrXHU0gYX78pU0Y6kzQA/+h4ANNDFqEktmCz5tRXkWYNR3q9d3Os
 iO9O6kBKeiJ6+6UkL0jVpWEz+f6MizE=
X-Proofpoint-ORIG-GUID: c8Rq2NWbJHeo0gTHG-S9Rj2x9mtzNDDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfXwlp+2YPKmIUC
 BPk2kNvk97EDmQ9m5BUexRFuFWRF1qxYRu3t0/aKtJfL0lE/tpH4qObLR+/qj0mGxULxgFS2Vb2
 ogpnFJN2Mf2eqO4yR4LOep3/zuaYnXTERWsMiy3PkURF2LmCsBaVvuE8d3zEgdih+znCtTbPuZD
 hzS+AvawSiEMW+s7DMquTIPLMz+rpB2+ukVOwDXyQVspzS7REf3JADIlfr+c73zPknaLiqvbtvA
 owZN06izIg3+TQwMyZDZiLaRyUVI3i3n/teroK021xYC8daqFjGJxdeCY/N/k2Yzyvq8PLPxhQa
 MkgvPT8Xkl1u1oXZX8Q6UVnNkXdpRT0XQbVIdUAO51etdtqeSIE1j8Tv+uJ4G1Ds30vO39stjqR
 hKz1YfR5n53DCkt09jnUx8cKWOsSnXV3kMePUlVxzFGxf1cLSXu5ACX71MI5yu+8w/MAMSVZLSu
 oEPGRg/nPKM5w9yXrTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220131
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113996-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: B99D16AFC3D

BAM DMA cannot process zero-length transfers. For plain hashes this is
handled by returning the precomputed hash of the empty message
(tmpl->hash_zero), but for keyed HMAC the result depends on the key and
cannot be a constant. As a result, hmac(sha256) produced an incorrect
digest for an empty message and the crypto self-tests failed.

Allocate a software fallback ahash for the HMAC transforms and use it to
compute the digest whenever the message is empty (in both the .final()
and .digest() paths). The fallback is allocated in a dedicated cra_init
for the HMAC algorithms and is excluded from matching the crypto engine's
own algorithm to avoid recursion. It is kept keyed in sync with the
hardware transform in .setkey().

Cc: stable@vger.kernel.org
Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/sha.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/crypto/qce/sha.h |  1 +
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 0a3f88aaf5169ea7b47a549bbc10ea87d3ae7a2b..d4d0bf88dea6bf1c58ee103cdccbbbfc266110e1 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -270,6 +270,36 @@ static int qce_ahash_update(struct ahash_request *req)
 	return qce->async_req_enqueue(tmpl->qce, &req->base);
 }
 
+/*
+ * BAM DMA cannot handle zero-length transfers. For plain hashes the result of
+ * an empty message is a known constant (hash_zero), for keyed HMAC it depends
+ * on the key, so compute it with the software fallback.
+ */
+static int qce_ahash_hmac_zero(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct qce_sha_ctx *ctx = crypto_tfm_ctx(crypto_ahash_tfm(tfm));
+	struct ahash_request *subreq;
+	struct crypto_wait wait;
+	struct scatterlist sg;
+	int ret;
+
+	subreq = ahash_request_alloc(ctx->fallback, GFP_ATOMIC);
+	if (!subreq)
+		return -ENOMEM;
+
+	crypto_init_wait(&wait);
+	ahash_request_set_callback(subreq, CRYPTO_TFM_REQ_MAY_BACKLOG,
+				   crypto_req_done, &wait);
+	sg_init_one(&sg, NULL, 0);
+	ahash_request_set_crypt(subreq, &sg, req->result, 0);
+
+	ret = crypto_wait_req(crypto_ahash_digest(subreq), &wait);
+
+	ahash_request_free(subreq);
+	return ret;
+}
+
 static int qce_ahash_final(struct ahash_request *req)
 {
 	struct qce_sha_reqctx *rctx = ahash_request_ctx_dma(req);
@@ -280,6 +310,8 @@ static int qce_ahash_final(struct ahash_request *req)
 		if (tmpl->hash_zero)
 			memcpy(req->result, tmpl->hash_zero,
 					tmpl->alg.ahash.halg.digestsize);
+		else if (IS_SHA_HMAC(rctx->flags))
+			return qce_ahash_hmac_zero(req);
 		return 0;
 	}
 
@@ -317,6 +349,8 @@ static int qce_ahash_digest(struct ahash_request *req)
 		if (tmpl->hash_zero)
 			memcpy(req->result, tmpl->hash_zero,
 					tmpl->alg.ahash.halg.digestsize);
+		else if (IS_SHA_HMAC(rctx->flags))
+			return qce_ahash_hmac_zero(req);
 		return 0;
 	}
 
@@ -340,6 +374,17 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	blocksize = crypto_tfm_alg_blocksize(crypto_ahash_tfm(tfm));
 	memset(ctx->authkey, 0, sizeof(ctx->authkey));
 
+	/*
+	 * Keep the software fallback keyed in sync - it is used for empty
+	 * messages, which the DMA engine cannot process.
+	 */
+	crypto_ahash_clear_flags(ctx->fallback, CRYPTO_TFM_REQ_MASK);
+	crypto_ahash_set_flags(ctx->fallback,
+			       crypto_ahash_get_flags(tfm) & CRYPTO_TFM_REQ_MASK);
+	ret = crypto_ahash_setkey(ctx->fallback, key, keylen);
+	if (ret)
+		return ret;
+
 	if (keylen <= blocksize) {
 		memcpy(ctx->authkey, key, keylen);
 		return 0;
@@ -395,6 +440,36 @@ static int qce_ahash_cra_init(struct crypto_tfm *tfm)
 	return 0;
 }
 
+static int qce_ahash_hmac_cra_init(struct crypto_tfm *tfm)
+{
+	struct qce_sha_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct crypto_ahash *fallback;
+	int ret;
+
+	ret = qce_ahash_cra_init(tfm);
+	if (ret)
+		return ret;
+
+	/*
+	 * The fallback is used to compute HMACs of empty messages, which the
+	 * DMA engine cannot process.
+	 */
+	fallback = crypto_alloc_ahash(crypto_tfm_alg_name(tfm), 0,
+				      CRYPTO_ALG_NEED_FALLBACK);
+	if (IS_ERR(fallback))
+		return PTR_ERR(fallback);
+
+	ctx->fallback = fallback;
+	return 0;
+}
+
+static void qce_ahash_hmac_cra_exit(struct crypto_tfm *tfm)
+{
+	struct qce_sha_ctx *ctx = crypto_tfm_ctx(tfm);
+
+	crypto_free_ahash(ctx->fallback);
+}
+
 struct qce_ahash_def {
 	unsigned long flags;
 	const char *name;
@@ -462,7 +537,14 @@ static int qce_ahash_register_one(const struct qce_ahash_def *def,
 	base->cra_ctxsize = sizeof(struct qce_sha_ctx);
 	base->cra_alignmask = 0;
 	base->cra_module = THIS_MODULE;
-	base->cra_init = qce_ahash_cra_init;
+
+	if (IS_SHA_HMAC(def->flags)) {
+		base->cra_flags |= CRYPTO_ALG_NEED_FALLBACK;
+		base->cra_init = qce_ahash_hmac_cra_init;
+		base->cra_exit = qce_ahash_hmac_cra_exit;
+	} else {
+		base->cra_init = qce_ahash_cra_init;
+	}
 
 	strscpy(base->cra_name, def->name);
 	strscpy(base->cra_driver_name, def->drv_name);
diff --git a/drivers/crypto/qce/sha.h b/drivers/crypto/qce/sha.h
index cb822fc334dc187cf1c66e2a332822a596ebcef3..2fa173ff2b2ec4031710ab6e3b14c28b04e0a746 100644
--- a/drivers/crypto/qce/sha.h
+++ b/drivers/crypto/qce/sha.h
@@ -17,6 +17,7 @@
 
 struct qce_sha_ctx {
 	u8 authkey[QCE_SHA_MAX_BLOCKSIZE];
+	struct crypto_ahash *fallback;
 };
 
 /**

-- 
2.47.3


