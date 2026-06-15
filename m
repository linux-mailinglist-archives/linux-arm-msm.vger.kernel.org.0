Return-Path: <linux-arm-msm+bounces-113215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qYIDEX4hMGpGOgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:59:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE4688041
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 17:59:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TdJMSSrM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cVj4w37X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113215-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113215-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDBF33231AFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 15:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8A340B6DC;
	Mon, 15 Jun 2026 15:50:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1986B40B399
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538630; cv=none; b=sB2NGHplce8A/aaCZ/uuUAo6sUeOmorlGGF4AuJ3kUJDeFwjbx/vWnIJkQzUMVtvr074RWYkNqe7RJsT2FJQJOTtijvs4xn25TnsYpcr6J+ER9F9hpSXSLSFOp6aYWuUmKebCDf8cIwzgmKdeAGQ5ztiEGXsHta5Vdy2cVk0Rpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538630; c=relaxed/simple;
	bh=SGpiGMPoMnJW8OsKM6YbK2sMApDpA7GM7O3oLvyBQys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pk4TMZAePsp7SwnIwzwx3MtFU/6w8JIRrUeYtkd3wMfiQyLnM9gFwyfplEcVEgb5ThwiIqbbT+Gkzm4PnTN/R+Kx9GPwdS8qsr9ktznPXxuLFuCNKHDzyQ5IotXXwJXZYSODmNDUh7ZNAE/WFL7UETmimgv1UyFI8sb0vPbnVYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdJMSSrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVj4w37X; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FFhLSY347078
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6sgKQfIbcheNzVd3O2AIimrVboSNykNJD8xRHhAS+4c=; b=TdJMSSrMO9k5R6Dz
	o5xPN88okf0ZEJs+gP0BjTdE5OOqhvLY9PN1zjNXRnoLt2GAlQU3MFOqJwhEXHoK
	wYhsSH8EYWrfnpJqNGW6wIqXeF3I/uJunW+EPXuIx2uzDaQQJOLxaPabshHNgBY2
	RnxGfjKKZe+eWZpS/aenARlHKnchxQM5wqWrBqnjOEP12blZvgs+NJbhS/M0Ap3F
	xiU2PviYlGX9rNY+JZsXzDp5UtFLfKOGBC8ghv1m0tcefTPEzonMS7+nx12CerHQ
	2T1IP6B14Pu32mh7VGj+rxx/GinX1hL2x3FApUsAHl6LtHIVJZA5qRc7QoIO7qNL
	jZTZVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjsk27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 15:50:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915d1d4fc5aso603597285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781538627; x=1782143427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sgKQfIbcheNzVd3O2AIimrVboSNykNJD8xRHhAS+4c=;
        b=cVj4w37X4NWJn7RMgXh4Ym9F3QoDw+Y31hwK2A7HjyOHrmkxu4s1Iw5rdoD1lciQn8
         PWoBjcUUOKh9GTfcOLWT7sB3CFXjjeQyN558tZyeET/ipaPEsdby7gOOUCxe+4QLIYGQ
         5N50+99SXiv9he+jsly4AArif/1Yw34z6zAPhFslwR/seqg9HzggBXOSxxN4FbbiWXwm
         3L1fQDdvAdVejbx0VJSnnwuUyPrlLNnbhfEVZjy+Vip4BXZrAJm4iFOx7hiv8YD4vNJX
         IVSA68L/FuQnzV1s3+SM6xrsq5Xcd7uIG4Vq75rm1YlY0Gw/m2jZSbM5Ne+rGOVcTZCt
         7HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538627; x=1782143427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6sgKQfIbcheNzVd3O2AIimrVboSNykNJD8xRHhAS+4c=;
        b=sNFzdDE/ERN6LOieTlxHjAfAEC1A5lbmiUPByNoC147hLWPRZzDJbBeUWdjInh4eqW
         qxpC4cfRVEvqPt0si5of9iSbJoF9DVnrhioqHrKe2a2yQC5RQOlpncKdact/SA0y9euA
         64vRjSpJzfGdfoGNO67PZT7IyIDS2yJ82QX+NjPrK7eszeTHEbjSmjlrsyZ/+m7fhARr
         pmhvbJj9e5bWTOxTu5OKROYjGhjPZ/qn7TpfeOdumQNiK0RstD9VFKudWGYMJSGKpms+
         OUkDAUq2HKSSz2NQZ3zjbjqCAl97CTRQtt/mAmF5U62mYnOxkBN5YDFRvIZt+w64oNbq
         aU6A==
X-Forwarded-Encrypted: i=1; AFNElJ+hUnWlCztQ8SVndQFFvB/FeUoetzrrY57g9vsgvN80TIuNYT+tmRZySVhvalppkEVxso2Wa0zkWk7CiHh3@vger.kernel.org
X-Gm-Message-State: AOJu0YwZh8GvZNwIjQ2wev34PLJJYhI5JQ+oG59W1TClLdfccmPUR32R
	NLGMdn1KMgK+soZGxjjKSSkBYXSwQotNWAphZJhvo8J/4v9KdiFXfJLXiUR46QgdoQM9ftqr0sW
	W9k82XjYVOfvkljO4jOJzNuMQJdrWx7M8O4K90GGaYAPkfQsPTtrHKSmXLlGYf3CT3bcp
X-Gm-Gg: Acq92OGQq2GjJaTHwfn89giUnp5+38YR3jVZf+nvksEK1tZoD7uFgRvRqh+VoyTwN9e
	LHyfXb2e5x49qEyhsyHgZkLgjq2377J4FnwLPxERsiwaquH3ibP2O454CdVDOsz3dsjBGr8l5/f
	2I8gdIaYd86D6/H4nVhGC+nPwWOjlInIikRjZcVOsteF5fdzzJcrFhz9wRHdWIwZgRxUeXP7WeT
	ah5bPqU29W5dQMcNfcxdAVjOLb6GO1L7gik2L8+mKzXnVlKCgdsoqWe+UcOopQdB7BVI2o1bIez
	hnbPbVpUxB79KNwAl/upnoTU9wExXCI34L5Pl/dAWL4aixtkxC1VHvTQDI7WvkRUK4SPX+svw8S
	bKVUiTirgLRAXcVy8vSJhMZ6JpOKWpcdYSyba42mF4rEhRObOMuE=
X-Received: by 2002:a05:620a:7106:b0:915:a953:4b93 with SMTP id af79cd13be357-9161baf5670mr2274027285a.3.1781538627409;
        Mon, 15 Jun 2026 08:50:27 -0700 (PDT)
X-Received: by 2002:a05:620a:7106:b0:915:a953:4b93 with SMTP id af79cd13be357-9161baf5670mr2274019185a.3.1781538626936;
        Mon, 15 Jun 2026 08:50:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7fe3:eaf0:5a0b:2610])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f450sm38643032f8f.10.2026.06.15.08.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:50:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 17:49:55 +0200
Subject: [PATCH v2 4/8] crypto: qce - Fix CTR-AES for partial block
 requests
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-qce-fix-self-tests-v2-4-dc911f1aad42@oss.qualcomm.com>
References: <20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com>
In-Reply-To: <20260615-qce-fix-self-tests-v2-0-dc911f1aad42@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3447;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=S0n3FvtYweutMZSxJALq2DQ3CjmyCxFcNrOXGyJ+JFE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMB8vWTxT6nK9U6anmrJqcFiMjPqzFfQpNqOUD
 5ZIdIjDEXiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajAfLwAKCRAFnS7L/zaE
 w5WJEACsEI87v3YbjeVgMti2J5cFz4Hd9oJCvqnot/2jl5P2OxJUb6RJ01yOawx/Oe5ZS0llkRy
 FJdJxUs+OL+S+KKe0H/Z2BJGDHNDAQID3twnLnL49jrZ0TYZki82H/AfpL/9og4KJhI3ON90XQy
 X6Q8p6f2thoRf9J1fnpnhBNATpNNqOzMBexokOROQcs8Fmt3nn9+kQPJ5BdecjtIQt9WleDloGG
 Rzx1fxrtpqVyrwwFS/7uWVMgep4iav8ZivIeuv9PC17Q85YxyJrtGSkkjcn2lNI6hCVdylde6/w
 xPhi+7VK86xe6F9eAF9bPMl4g3g63fnxAK3kXTFHRApAgznEFQOAa5pZzAiEaviQdKZMYZxKFVL
 fCqcxGms7i3Rk7w4SoNoU8BlvifkRbqpj5obfqUtO4f+23NF9cp7xEbM/IYYaP8bd0G7w1A6PZi
 zFybf6V0BvxwGO/a2Pc6LuTtyX1S4hkN9ilymDJ6Ny+H6FrFKPZDNNyPVLprnFLpYxHD2PSRpW0
 VjNk1Br7vflvd4mJrmdi7uqjRkNahko5DaY88ig9B2VFRnvNJXhufKjHlz3P4iO7TBt0gYAFKzz
 LlWFQkQWUPjIt9nK6p0WIFBUeZhJlKqqhUSiHPRv3O4b9K/Ifxhj3vc59xYTa6CTNuGbaNlgcYF
 emGZ21I51dtksNA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE2NyBTYWx0ZWRfXzcK3/IO6XgBV
 01oIMlOh5+iQD6Y2WyGgY+3vriJtCVisrjCRgrTl7wdcwPWiEyJd5rlswNA3aHtVNgxZy1PW5nW
 In13TIryfwkvoLjq21uNJxDoJygBkZmJJeU8DuBMP7XzGOm5hibQa1UYB5mPeOMqjDStrMRehfv
 VuFpVAvU91RHw+fjTrXezF8yhcUduwwkWt51EQX7WQMzFw8eA6GwLUWi37KvmLBTa95zXgu2eHk
 vpPQfWm4qABMd0/OQyRbNEgROckwj+1bnz8kUaP6Snyu0+jt6f4cvoLJf234uGGFaxDCPP1MW34
 vt4/zGLTbkXXFxB132ucKE74KdqN1gdBvzkRfkcsRKxl8lTlwVMF9OuUzyKsyHQvOGKr4zeBEM4
 kLCpGH8SaTiZFa25yBgjrwnjw7rmTop9ytjyo/UPshjCHTYliffpTACYhPAgrzT0P2aIT4nTyci
 P6JGTxP7pLEI1O8S5HQ==
X-Proofpoint-ORIG-GUID: C6VqYBrfb5YCLfxyDdiDarQRs6BPxlbI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE2NyBTYWx0ZWRfX3IW2JbOCKKej
 lezyLftpU1FltKlZQaIAfTE/oRYAAXepGnxXXuhfwFiM7PBQZqigIq7zTqfFQ4leQUQZb9Xr1c6
 S7u10KVk1fZ12mWg1QoiE5/0/ZAPP38=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a301f44 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Y2NcAOke46LZopEJyX0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: C6VqYBrfb5YCLfxyDdiDarQRs6BPxlbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150167
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
	TAGGED_FROM(0.00)[bounces-113215-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
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
X-Rspamd-Queue-Id: A1CE4688041

From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

In CTR mode, the IV acts as the initial counter block.
APer NIST SP 800-38A, after a CTR mode operation the next unused counter
value is:

IV_next = IV_in + ceil(cryptlen / AES_BLOCK_SIZE)

The skcipher requires req->iv to hold this updated counter on
completion, ensuring chained requests produce correct results.

Referring to Crypto6.0 documentation, Section 2.2.5 says:
"The count value increments automatically once per block of data (in
AES, a block is 16 bytes) based on the value in the
CRYPTO_ENCR_CNTR_MASK registers."

QCE increments internal counter register once per full 16-byte block(for
ctr-aes) is processed. In case of partial request length, the hardware
uses the current counter to generate keystreams but does not increment
the counter register afterwards. So the counter value written in
CRYPTO_ENCR_CNTRn_IVn later once read by software is one less than the
expected value.

Crypto selftest framework capture this scenario with test vector
4 comprising of a 499-byte payload (31 full blocks + 3 partial bytes).
Error:
[    5.606169] alg: skcipher: ctr-aes-qce encryption test failed (wrong output IV) on test vector 4, cfg="in-place (one sglist)"
[    5.606176] 00000000: e7 82 1d b8 53 11 ac 47 e2 7d 18 d6 71 0c a7 61
[    5.606192] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=-22)
Expected iv_out: 0x62 (iv_in + 32)
Obtained iv_out: 0x61 (iv_in + 31, partial block not counted)

To fix this, just increase the counter value for partial block requests
by 1 and for the full block size requests, don't take any action as
expected value is already returned by the hardware.

Cc: stable@vger.kernel.org
Fixes: 3e806a12d10a ("crypto: qce - update the skcipher IV")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 68b83e3ae088ae42a7fb2a2f0c2e132acf62e849..379b45d2cd952a39c387e84af71238b53f7737e9 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 #include <linux/errno.h>
 #include <crypto/aes.h>
+#include <crypto/algapi.h>
 #include <crypto/internal/des.h>
 #include <crypto/internal/skcipher.h>
 
@@ -34,6 +35,7 @@ static void qce_skcipher_done(void *data)
 	struct qce_device *qce = tmpl->qce;
 	struct qce_result_dump *result_buf = qce->dma.result_buf;
 	enum dma_data_direction dir_src, dir_dst;
+	unsigned int blocks;
 	u32 status;
 	int error;
 	bool diff_dst;
@@ -57,7 +59,21 @@ static void qce_skcipher_done(void *data)
 	if (error < 0)
 		dev_dbg(qce->dev, "skcipher operation error (%x)\n", status);
 
-	memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	if (IS_CTR(rctx->flags)) {
+		/*
+		 * QCE hardware does not increment the counter for a partial
+		 * final block. Increment it in software so that iv_out
+		 * reflects the correct next counter value expected by the CTR
+		 * mode.
+		 */
+		blocks = DIV_ROUND_UP(rctx->cryptlen, AES_BLOCK_SIZE);
+
+		while (blocks--)
+			crypto_inc(rctx->iv, rctx->ivsize);
+	} else {
+		memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	}
+
 	qce->async_req_done(tmpl->qce, error);
 }
 

-- 
2.47.3


