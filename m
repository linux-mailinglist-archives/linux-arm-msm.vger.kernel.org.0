Return-Path: <linux-arm-msm+bounces-105142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JYJFevB8WkbkQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:31:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 116BE491350
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 10:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DBE53079873
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 08:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336573B2FC0;
	Wed, 29 Apr 2026 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNIzo59C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnws1Hw1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BC73B27E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777451347; cv=none; b=ciXgq8jyBYAeyj04IxNHJ/TLl3KybeRf2fNzFsLJIsFZ+gkt01mIIGEU2uLQIQQSj2Y1mfs7Thd65Inf2x4aE+01tpKa1ttdczcKGXRa4p9Sky9Js1kxfiPK5qe+Xv/fF1BGH1dugcoxGv07axsspAGgkoT7U2TQLKrngA0m4sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777451347; c=relaxed/simple;
	bh=NMbmUa/Z/P8s1i+9J9SWnpDqu/ZnM5WIaLzDgULOUOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=en8WpjZCp6pG96/yjGnzV1VjfmofSAHq2P5BtX3fBgwhAor6m8M+ynlg5dhUhYj3EIKwyvrTQzFmeH5xTV7uHfzRUgeAZYlcQCvstAFWI1Ydu/j4rtPeo8S9pcLJZghtKGKwq/yIr4gsbr5gxJn/poRa9LQttCjhktSIYOaLdqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNIzo59C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnws1Hw1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T84XVE1620946
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VlD6Drlg3A7sUzQoyWrCGwHxyeMtG1KLVPsv3qmuRxM=; b=UNIzo59COmbRk+I9
	lRVW/wcxw3B09B/UKEnF9Q308iJ4di+UEodyA1hKRVHhgwy/+6u1DRV9Vt8G69C+
	5pIihZNK3rxgQULbf2c+tHe12pBtggH2fsDodFV2WehImHMVhmsj0arfsaA+1lNj
	nNAc1CysprUxHX0NOHzcdmM7EwYIT5CSSOsujNAy5GiK0hikOJyDoKgfwEP5LgVI
	9R+xbsQE1tsQ2gbbI+PlKM+1sq7l8+YOZ0O0C67HPt4e+Qr8oBWL+1bwkLdCfqXX
	OQRMsetxeopojSy3DWBGltTstPtmEnsM3TSOP9bEKvp3m71KR/smngx394wx38Tp
	qvOuww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5kr3bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:29:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da4795b3cso23868653a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 01:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777451343; x=1778056143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlD6Drlg3A7sUzQoyWrCGwHxyeMtG1KLVPsv3qmuRxM=;
        b=jnws1Hw1G/SVrladfDA2BjGw/1Oy0iZm0pihCeTVNN2tM/EAmPcniX3Il/Jj59M080
         clIOhtvao6/FjLvHGEUdrwdmKbBE6Q6+km77an4x66P+A8rz6aCey425k7jWaMQrEgKu
         4kFDdJHn6EjnqiAyKMc92GmF9W7OFGD9/QBz61xqTQJlQdRohnNt0nAa49zU1r1lgPPp
         ed/CiclzzcQyBW2+gzVreJ4g9/ZLLbPIh6hF2uuYrjC+MJqnjOO5Iy/UzkMAxG1ATQHz
         vJT1iSPw4bapmn+FWdIGUwOYWqFOx3em2JKhUQWRCRz+l6oI2YhKoJk0FvvyKamva4OB
         UJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777451343; x=1778056143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlD6Drlg3A7sUzQoyWrCGwHxyeMtG1KLVPsv3qmuRxM=;
        b=ipRt7GFoR/c9G1Qf13NSEG/pCuNXqiTLyoQTZ+0TxnTnIb9n3Tofr6ej1CITNREEZg
         dzvQugGYYeKtlAT9Gto6KRzh4+t7tTze8P17HkoZU9pHgpARXX7rRuefbGTZo39nBDP/
         ++XQgGRyW+e7UD4HN9gtiI5LnrKvA14NVDOvhzB5uiz/2t45o02jcpgyiNsZmsXNEhxO
         YHtYttH1GWz8TaLfQJAs8G/cNBlBJUILFuovH8ulxng1/waKWGQAq5cw9QS3UCOC98Kl
         YKNuY2jLMCK+5Rt4dNgjzC1tgIPxpVr/fvU5t4Ar7HVgx0qdhVl3AeDnTeHHBFM2pAwQ
         aJMg==
X-Gm-Message-State: AOJu0YzcldohZbK4lYsS0Gm87St4G2ojSWigGlrdu21aXbLk8R633nOR
	EH9s4XGFBFa9uXa05norvk0dYgShuAChi1U8iQIpBOmw8FbDB5jdXrAVAQ+AJeVIUNYG5m/GtZC
	k80KLFbifwA4IguBBmHSegigCA4R29xd2mqTsrnGofgxqlM3k2tkGfCxdqoj4gt4rDMBN
X-Gm-Gg: AeBDiespB78mM34eVFujHXUj8wMqw7dA23bR972XwokEkb5LjusRjnvuTTTI9KvdAlM
	un0B9WneIBhjG6DqFd2KpaswfEyIXrTd8e6/T5rwqalhsmd22bvF0PciYDN3+9RJlB6PJ4R8hr7
	uhw++6hiDJpxrMnomJ2BguW4ECqjUJVeTHAmwarA/W+9TrRMi0l/rm822yE3ojPOYVvKl54Rftd
	u9WJhkv+RHO8FLVvyxozg49XoRuWcJ7sDTgvQSPBlRRGaJDJ6LRDlJoEOlnsEzL48XBIHxrZscV
	FtiUa/8MrCDuZvrsLrbq/8TiHyD/+6Qvs2Jy6k3AeE3D48G+T4qKEdWZzFAG/oOYOfSWaFkFcqK
	c9gSiGHoLKt5XjvKo4IsFFecsZoxc7AeDDhAKjbbYyH+AIXmmv4JXcBTHd2I/tB77+ITrAKwjCb
	OAbbJhFpvG0h4MyIVh3xC3wLLJfmE5jRySI150S3bFIDfX9mvWWNU=
X-Received: by 2002:a17:90b:4b8f:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-364921bfab3mr7376149a91.21.1777451342802;
        Wed, 29 Apr 2026 01:29:02 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8f:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-364921bfab3mr7376128a91.21.1777451342309;
        Wed, 29 Apr 2026 01:29:02 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a41520dbsm1396271a91.3.2026.04.29.01.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:29:02 -0700 (PDT)
Message-ID: <cc4380d0-d9b3-47d3-bc80-1c970ee7a5ea@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 13:58:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20260428-nord-tlmm-v3-0-f16f08d084cc@oss.qualcomm.com>
 <20260428-nord-tlmm-v3-2-f16f08d084cc@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260428-nord-tlmm-v3-2-f16f08d084cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4MyBTYWx0ZWRfX823gPOLJ1Sz1
 Lef2KLdNx+ruPDhT9la4fCcErvqZd2aOr2cn9NisrK2tEqlJlfG74rtq4dibG42Id8fqwC4EnAk
 4CD7KqWd0HzvME4wNqRcldSfS9Txw1Nt3OYYeRhtUGN4XmPyou5VCvlOEQnZK4I19wWRfRiaqeJ
 1EScntVK7qEiJsqbxOCeaYDZPqIOHom3md/zGprxtC+ArjSPwRbeu+2QVdnef3EIeCMEykpiwqR
 HALvLZrpa2QkRzT/LQSHsppcA7YFJr9Y9jYwG47H7PXRu4M7HsH3OTMG8e8WSeFoF4RkdIY7QYS
 TvBL6ck5MPAgMnLcynGWmnhly4SE4cgMcGt3pgUVVzfOdMUAMPD9Sak313QhLvXbR5dp4Azwcln
 ENvRko/VGKDxk6Up1QpjNOnR2FlAkZ/WDiQs4lDRGumeWfHlfP1zKE7Riq/gSaTB241MeVXSyPF
 KZVikViDYEJCBXVW+QA==
X-Proofpoint-GUID: wmFfyB8wVUfATjDkE9q_Apy_0KoSSd8O
X-Proofpoint-ORIG-GUID: wmFfyB8wVUfATjDkE9q_Apy_0KoSSd8O
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1c14f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HC_c-dvtGznJx1dPDJUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290083
X-Rspamd-Queue-Id: 116BE491350
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105142-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/28/2026 7:18 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    8 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 1771 +++++++++++++++++++++++++++++++++++
>  3 files changed, 1780 insertions(+)
> 
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

