Return-Path: <linux-arm-msm+bounces-116881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K+42EfC3S2qgZAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:13:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D364B711CD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:13:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iTwXJmPw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=drNnAv+s;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116881-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116881-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A0069301ABB4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116ED378D6B;
	Mon,  6 Jul 2026 13:54:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C5376BD9
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:54:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346070; cv=none; b=VuDcpF5x34c+fCMEzm0vc3KdTgSAwddN4wp1TPbjXIDeYATlBg1IL8EU8NhvbhJaBl0kWnvq0P31NTugWE+XKk4xJt2G9ucPnOPwjMKl978VicyHE2pOXTIibXZZWUZfWjYyiIg6WMMdjaGW/O4zQlanU7rTKHLDdxUkZS/4IBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346070; c=relaxed/simple;
	bh=q9N7xvaeFpdxSCk21VylCtI8nPZtUNdJ9Z4Mvdcp2Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agRH4XLLX2R6Q+C1lLbYFJ25XxUr5WOUSxHhixcWDUml52o4+cUALGrD8BWTtLWhSspRvTOxJpuc0q7Qcp/XsA8svSNnLv9C1urPH6rNQobFLdUafxoXPRCJ69peTBYNK2akuWHdj4K9RqgUER+wXER6P+II9j9cIacO/7xIivc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTwXJmPw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drNnAv+s; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJm4361440
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	onHSjGInX0rV0mVGlTmmcWeekHeD6EjKdPIS+Vcr65E=; b=iTwXJmPwI18DLyaW
	KRSLXbhARpIuVdP3sGrJWqtbmqwo1v3DNbQmiFA14YSrIXl3uCInXeCBSv69hNgK
	cvSMIhfyOQPsUE2dRx5+JbOdlc6KR0h9nZzPWq6exDrm2HI1bvQzKbRey7a55d23
	DtVupoV1ziTzldEeZhYVnWK0UEZWWfzhLz/zhYc9EDNUzV+br8Uov7Okp+dk3DZL
	IDTSvrtdKorM3kTcbIR2Mn8Eo5IOExksQbaGDYHzQCOGus3ntfJvL2YXbn2YEVxJ
	dk7+HHGu76KcbiyPpDbmVQfyPCDeLNZgzm+aGye452NEh+kVVlQbKk1LehSvly9F
	or1HPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h51c70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:54:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92aea0d801dso289446285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346067; x=1783950867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onHSjGInX0rV0mVGlTmmcWeekHeD6EjKdPIS+Vcr65E=;
        b=drNnAv+sz+0bZhoDvvWJw5C/FSouGYlK+dmxKTNWU5jR6GTgXaOeewFWYzLnlXsEW4
         IkZ5Nhx/IOsvRuZCrsWCDKPt4u7q8K0G82clTCG2ucKaNrPNm4ft11dCCKt8WyXqCVo2
         ZD7DZle4Dfe2pToUiFikUkIbywY8w4fzsgfEoO6KkVp5LBccsKSjo7QIbmq8kZLUSC6e
         s8ArAxrVC72yHjfnRjuH92TGLO4+5KlfU4Tief7+c6Ui+OxFIAhOBr1dIsMIg829xIjB
         sO803lOQCGjpWFAVyZcXjvsGf6V/ZIrB8HUBaAuzzCwcV84GtMYgWdb8OHMtDf041Wb3
         Uc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346067; x=1783950867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=onHSjGInX0rV0mVGlTmmcWeekHeD6EjKdPIS+Vcr65E=;
        b=NDLRKqbDcP4e1WQ56aeAwoE+D2NoQdX4xVLhPdMKewUGHQ0432j3xP3GeF9vXDuhoc
         qctNsyKNrI4ob7bwniE4qa8BGo/NR0ebcDBLhIAzWJcb87HYxgV99xRP3YF1G8ObuFpa
         PSNnHVxOUHdOe9n22nBjQsFnCywa3TqNlmVO5kRkpRrFu1aC7EwBniU4nzO/xt9NrOiO
         nNcq//tkzfok4bpnukw2XuW2fZnY351f83jQoQl6tpkTh+Y7cqk+A8e7xWFGf5QG6/uf
         vrhdk+fhudlSAmxlGS+kcaRy/xE6GI5Nx8RGYDGNkG0hROszV18x5e0cBqaFOEUM0c2p
         LHNg==
X-Forwarded-Encrypted: i=1; AHgh+Rqe4y9e5t4bXHzfLAVne0bvKqO/bipXGZDgQSOOfBJakB2gOi1ynFe4p23AyyGv8srsYNDQ46va1RA0DT1S@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvdoj0ClVn+dI/1MNBDco1WFQHlDaReWrd0AdByonLzeXG4X+8
	znC97fzJEfrcOuJ0yxSIoBQfv/enM4aqmSA5Q7mtUJlylRs3xlcV8OJoR5EfZaBcnPEezrNxGYy
	9Z4u+Smn9sNaY4JkXQrh2p85U518VbnmcWudq2hzjS5U/gsF1/msuuiamYHCKoPvB7Lyb
X-Gm-Gg: AfdE7cl0rxeOjlpQQ033FQnNpAVNcJgemcEHNbGCx1r0Hz98WvjWYhyBO+FOrEQZ+Oy
	LGv0NMHNSIx4u9Ilk0vrZ0wOedlJMFIVqb+9rTQdIiw+xqzEX0mTxCXZ2oO2A24WpIw36mHW+Fg
	CINHDv/wclFRC+GzYpRT4dx1dP//iO+5g+a1MpeTqeJEHqRoHzLCnGUQlZxGDg4RxqEfhRL5Z18
	7RF1aZ4DeKwQOXicqzcwiM93uzGruf00zmCfcfN3/HXeIE8z3r4yvSS9mCMaeKaHFzhi81gbrUR
	ExnuyKwFo0bQ6YRoDHQP/BQVMQV+CEs/xzFA4xNfp56IJp5XoTWiJMtblpGdr2C7jLX5YFq1tIJ
	4bRnGOoJNg1Z/+zH/5EHO2dlvJlYeNzXYAClFQRFq
X-Received: by 2002:a05:620a:7101:b0:915:efa6:d70b with SMTP id af79cd13be357-92ebb553714mr84767285a.43.1783346066777;
        Mon, 06 Jul 2026 06:54:26 -0700 (PDT)
X-Received: by 2002:a05:620a:7101:b0:915:efa6:d70b with SMTP id af79cd13be357-92ebb553714mr84762485a.43.1783346066153;
        Mon, 06 Jul 2026 06:54:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm619805145e9.13.2026.07.06.06.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:54:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:53:58 +0200
Subject: [PATCH v5 7/7] crypto: qce - Use fallback for CCM with a
 fragmented payload
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qce-fix-self-tests-v5-7-86f461ff1829@oss.qualcomm.com>
References: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
In-Reply-To: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2908;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q9N7xvaeFpdxSCk21VylCtI8nPZtUNdJ9Z4Mvdcp2Gg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS7OAaVRF+YYp9zlxR5A6KJaHc6oHPNIsnNvFJ
 8XNJdcFdayJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakuzgAAKCRAFnS7L/zaE
 w2xJD/9zTCbYP5yPD1HGULpdCAOQ8zNWBFieKFYghalVDiNHTrZW8xGO8COZ71OV2CHogH6NWs3
 bR2+PsKIpxIIKpKg/LXnYEPLNwYaj0rTfHbAKRxaIwOTlyfBccdUwatfSpfrEUFEOhl+n2Metz2
 K8XQ1fDIlR3wJUVE1QJL+PuxHkRIzBfjx1LDz+3LnO7GlWsDaNGi+06TJ+1pkw0CVJtxHV8/dtT
 gv9tu5Q7W6p2IpBxMx2MiavorXo/stO2xME7Urilopf/gHDr0kTt4svlEDE8bOGOaIOPX6uQ77m
 sziwizLgAw5MkwNl9dPo/JEuJo5fkGKkNYHkaxk2KrBP1M5ay5hz+WG+eByXfq12dn+tV8+drbL
 IbWnLHt46Ryl+gWkYgcL2YRzcoyMTnJEYfp/fvLJo9btL97CI8wNrgx3bZsS/+58yWyZBR0GHF4
 5paY/Lx145wgeNOZYWTUlM+wAB/9/9FA/umCe5mMD8QA+xh9zGawW7EwjebckjAGdFHIVfu+PVH
 Vp62Wt5beX12EvPA4+SsTapkXSnyXMFPXfvs1qLaQOEDfBmdIErPmXQMaMCNgq9vDv8WqjX5vWT
 yPybwrSLXyS1HYlyr/hPw/ukBzM+Qtl6dPNLqTThQbrD9HtpcDOID4BJjegMJy7nP8Nuuou99mV
 d2DxOan0Sjg/kDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: gEYeyW7Xfrjb_iLeImGFyY8PkeT9RHKX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX5qAFx1InRV5t
 E8rGYPkSmS7UWU8fIsMZwJMD3Al+AIgDB5uYRbFWDh+Bk+dtxzxVmmGgJZXXXZBFTr/oidWPxTW
 IcKo1otjWpxXepz6fjnDwNNX8c2uwOI=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bb393 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=phyxH6jkQibGXiXynFEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX2KNwugHqlFWu
 DQl7ZF/bhFWkYSsTGOQGokrPskz2hwRe5e9YFyRn470kf1bcYCQ2TwtGQ6ADGAsicvUJpqjxJhx
 oeHjmMgKPhTG4IPTTCT1SAJPcouj0ml2Sbz+oOQZBsH6tSb0xHQadxFruiLnrQfH0Mp3jdPI0xH
 1+ddFcyRwSJLGI+RppklmZ02UAInSaxtvK7d0EAJEhW0k7kHB6eZvyCoqLVCM9Vj2XaV5Su1WeF
 uHIYIFKu5PkNFNWV/j5hb8ddeAaRlvzvqpN/UP6s9plnL8dnEC73TUYnCx6cr0yes5Dm+X2txaY
 Auuq5aSEnSu01YslJuhflkLn3Gf5EUIkkVyKFNpHSrZ/f6UQKLTAcUvGJtNf1ZVJDo39UYHttgT
 WD3PNaUXIpgqo64WVWNUQ3jXNyBtNlNOkv2FynD3XGVYKcBNyyOg4OpxmgRB6llzn6f7ynDr/Xa
 9FWF9e8omAxsPwTsfRw==
X-Proofpoint-ORIG-GUID: gEYeyW7Xfrjb_iLeImGFyY8PkeT9RHKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116881-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: D364B711CD1

The crypto engine reliably processes CCM only when the message payload
is a single contiguous buffer. The associated data is already linearized
into a bounce buffer before being submitted, but when the payload itself
is split across multiple scatterlist entries the engine stalls waiting
for input and the request fails with a hardware operation error. This
was uncovered by the crypto self-tests, which feed the algorithms
randomly fragmented buffers.

Detect a payload that spans more than one scatterlist entry (in either
the source or the destination, skipping past the associated data) and
route the request to the software fallback.

Cc: stable@vger.kernel.org
Fixes: 9363efb4181c ("crypto: qce - Add support for AEAD algorithms")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/aead.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/aead.c b/drivers/crypto/qce/aead.c
index 4fa018204cb628c112f64c45ff6c7407df73b945..9ff8fe2a7efcd2734e4ff029744961a7b1101013 100644
--- a/drivers/crypto/qce/aead.c
+++ b/drivers/crypto/qce/aead.c
@@ -498,7 +498,8 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	struct qce_aead_reqctx *rctx = aead_request_ctx_dma(req);
 	struct qce_aead_ctx *ctx = crypto_aead_ctx(tfm);
 	struct qce_alg_template *tmpl = to_aead_tmpl(tfm);
-	unsigned int blocksize = crypto_aead_blocksize(tfm);
+	unsigned int blocksize = crypto_aead_blocksize(tfm), authsize;
+	struct scatterlist __sg[2], *msg_sg;
 
 	rctx->flags  = tmpl->alg_flags;
 	rctx->flags |= encrypt ? QCE_ENCRYPT : QCE_DECRYPT;
@@ -522,6 +523,27 @@ static int qce_aead_crypt(struct aead_request *req, int encrypt)
 	if (IS_CCM(rctx->flags) && !IS_ALIGNED(rctx->cryptlen, AES_BLOCK_SIZE))
 		ctx->need_fallback = true;
 
+	/*
+	 * The CE reliably processes CCM only when the message payload is a
+	 * single contiguous buffer. The associated data is linearized into a
+	 * bounce buffer before being handed to the engine, but a fragmented
+	 * payload makes the engine stall waiting for input, so route those
+	 * requests to the fallback.
+	 */
+	if (IS_CCM(rctx->flags) && rctx->cryptlen) {
+		authsize = ctx->authsize;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->src, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? 0 : authsize)) > 1)
+			ctx->need_fallback = true;
+
+		msg_sg = scatterwalk_ffwd(__sg, req->dst, req->assoclen);
+		if (sg_nents_for_len(msg_sg, rctx->cryptlen +
+				     (encrypt ? authsize : 0)) > 1)
+			ctx->need_fallback = true;
+	}
+
 	/* If fallback is needed, schedule and exit */
 	if (ctx->need_fallback) {
 		/* Reset need_fallback in case the same ctx is used for another transaction */

-- 
2.47.3


