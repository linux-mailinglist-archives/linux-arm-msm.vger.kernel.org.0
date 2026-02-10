Return-Path: <linux-arm-msm+bounces-92449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNG8MVP6imlBPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:28:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C30A118E00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98851303CC20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D5333F8B8;
	Tue, 10 Feb 2026 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWAFembi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMkZFxHU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8792C1CEAC2
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715729; cv=none; b=e9Ne2i4NRvtVyv9Uc0XcjVZYb+vpacC2DuphOm7CBcD6bOJpsgQszmcJyI+7qWlA4hGex9zsjHvQGwLtNDEgmmxt4ovDVjpBYgdVZlamDQLk0DQ4Jp+E2uSX8kh2U7dCIb3Ga91/dOnB+CHH8eUjZ4dwtpF/eHJJ9bWs9Vi3NWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715729; c=relaxed/simple;
	bh=i1fhoxdAxQ4B03dy/DI680fa8rqL0tKH+RPMzYhCPq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hjOR+JW2RPLKhEORL5S6IsSLIgHd+m66LNNtlXf/dr/kl2OxL3JTjm85WW0bdrQ1ib+dNzYqFJHJKTjC22ylA9NtLrpsvw2dULoN15BC7lggr0hA6YtZ9sUqGvgnuIV65vhQKczXUdCFhmxT4KygTz83Rc6bp4OPA5hOmYWAg80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FWAFembi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMkZFxHU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A76sGj1151608
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxErkvKkVbZnV1IDSUaX2yGR8Pf3Ci2yzfoXqbmX8rc=; b=FWAFembincB23m5w
	pmApDP65zET9PFQYVcMzXtjSAI3PGjPaFqWSwdxrloJ6LaNy1XbOHy0rYogMtz/O
	BOREvQCaTDSfyPcYWgpPm/HfNQYqunTy+UWqk0G3jHwrN2lLNSKZRaMan0Pcj+//
	R0q9L2qM1z7k6jy5qX9AKq1fcxgk9Rd2FRWn76UVOxzkAXMyAq25VZlz+3GW3nDO
	mgKGaUH69drRSUj4Y1kwr2qQck8DESt0PXz1JrH6PUOgZ4uXECm4W8VWVuTM19Ak
	botBv36eotJ2h2ZPM8wUFcmdPpoM8gIdbcaVnhMfJEhyFVN2xnbHYYtlGj5Mxr9o
	3lfJwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c800j8gwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:28:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c53892a195so102923885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770715726; x=1771320526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxErkvKkVbZnV1IDSUaX2yGR8Pf3Ci2yzfoXqbmX8rc=;
        b=KMkZFxHUScH5u3afcPRknqQbr5xk8rL5WPQgWUdB057E1SoyB4ZG6V2TEIk1wV/NvV
         Vul7DmfzMsFEv/edK+Pw9Sq4UBjXF+usfyfgBDWCPbQsBGxX5hJTfzbSOdt8uWC2wryw
         nJUG1KKmBKlge4Pp6UKiBr87xuVeXIA9mnHXEsKD7BEpfKgZdLr/WfhjbFe8J/HV5HSL
         gxhhY9xNcgpJKHGxBfiB9+FCp5O4UqgbWmV6cZB94SLwB0HD31FOcO4UYgC6eilOom+6
         RJSS1m9tiY3H2aXT7Ptsi6IlVlh7t/anz0i3pKI0OedOwPYhCXsikUkOXiFhVVjoQyqr
         2c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715726; x=1771320526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxErkvKkVbZnV1IDSUaX2yGR8Pf3Ci2yzfoXqbmX8rc=;
        b=JnaiqnAdPigYt123xm2tvy+ZKcU6IBOfh/yI79KBaJ9IB400PmZclgRmfvP8BI8o0v
         ioPiRP7Q0bfYOL5yzEc8psGQz3kK7OCAzR4G1hgAI0p0eaXg5bC9fF6YOrUtmdbD8CGp
         IGmdwQ5op3BxDMAK66eGCNleg2lx1mZ+T2kJY1dGZ+BA6BP4iRguagAdKNkKO6M5I/6k
         XzDfxOcaDyuaYqw1MapbZyAd8yVB3+1fzIj0sDTsnpBGTk6+Sbke8S2Cw3uuHWs9dXOL
         ECoQlr8CJBCnDqna/yfnYFN2Owh1Loj5xNIAJZg1lklw5L8r9ZOK2aoHSrk7wHFJ+9tK
         RAEw==
X-Forwarded-Encrypted: i=1; AJvYcCXQidTm8e1pQghE+pYDy/+MslyjfHaS9GVoAzqld3kDcVpnV9xCiNlJ8SnK17LCSVBI0O2qCwA2JXTSZZir@vger.kernel.org
X-Gm-Message-State: AOJu0YwFnI8iH0D2A5WFgFhhc8CqHTwJZsB7yCpTxVxdZyXTB1BVS95M
	gwLyDf0GGIUQ+5FSWPKRskwO+sQURF7b2ASNXp1ipTkmqjayokCM9Caqnznn5wmGw661AoG7FMn
	bYuApyACzHNN8mmixojuWfM/AyqwRS5f4BZrItZCxioldU65Rh3UcNx0AkFjAHgi9krFW
X-Gm-Gg: AZuq6aKtAldjwQowcQK0kZPiVb5FzGr0zbYdw251QUGsS2HAvtK+D4Gk8mw0L+xSRet
	y40wzY4PgG8ennfG1UZqlCu6+6yC6/Rgg1t5T7EJWqN6QMumFu27S8WmQrdFMYhtXlopg7HdKb3
	Y1EfNVIlhguHhQMpY+8g9VFpQQrMhFBbTlcY7UzrCUhr1NDhXvdTUiylbJffXkni0Rl+UIZN+wM
	gA1W0yVNNZ5rf/CferB3ups+5dUk5IQbEwvGX1K5F/DLg81z4vQJKVgySGDmPLOAN9YkFh+s4G3
	VydRnq9o6s0SEr/TiGN5lwoHzBOx/E2Ou3m8ngv/dVPWC/A/l4Hthe+8+4V3GtzU7O44i90tMep
	QKddpex1bclgwfZ21K2p77dOsqJ0Y0AEVdW+5ojuTqc1ZOR6M9wtLipvu/i+bewqrVm/GnhGgeN
	iGUeY=
X-Received: by 2002:a05:620a:4801:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8cb1fe05b0dmr114181485a.0.1770715725982;
        Tue, 10 Feb 2026 01:28:45 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:8c9:ec71:b224 with SMTP id af79cd13be357-8cb1fe05b0dmr114179985a.0.1770715725568;
        Tue, 10 Feb 2026 01:28:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3bab5sm487480266b.61.2026.02.10.01.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:28:44 -0800 (PST)
Message-ID: <7a23d7bb-56ac-469e-9132-fc0dc9ee939b@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:28:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm670: add llcc
To: Richard Acayan <mailingradian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260210021957.13357-1-mailingradian@gmail.com>
 <20260210021957.13357-4-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210021957.13357-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3OSBTYWx0ZWRfX2mHda85hXZoQ
 0RdaJzzfVD/CUJcjaINb9eDihWftwkAU3DW5/krmMHd9QqUd0bfZpJ3PvPkoY2zHb8SLedVEkzw
 xoifpubm62bQ0vQKoPpKcuo3slbEm7JcnP00TNen9HOsM4zaXQgpCvQLMMKJoqaeCsgNiHViRK5
 bF8hONnOXrDHI+IsMPD6cHvBLDeL92/AzT87ibYfjIpiDASby23mqKpAocd8Uw0LJRMESQVHG0B
 UzaqF2wu6zBcNr0N+W6lwDs63g4IsTJAKtzi5vWSYJ8m/goUNWndBV6rF0m09Lb/fm3u5lTA+vu
 b0GoCBOMntmdOS9l4mQL84XMAlYGTuSOqsHWFOaEKm61QSSkjW2EalKQr6ZdrBxWvGGAd15SZBk
 4WmcH0Ofbmnyqad7pWKgBehCYL5x++nF2gKt2kRrGvW6HrpC+VKhO0h2rpNrD9yjTzdw8CazDPh
 vESfIG5EPaJls7ShTTg==
X-Proofpoint-GUID: P_BNWIgPiPj2IuKF179r_K2_dqz65FP3
X-Proofpoint-ORIG-GUID: P_BNWIgPiPj2IuKF179r_K2_dqz65FP3
X-Authority-Analysis: v=2.4 cv=b9u/I9Gx c=1 sm=1 tr=0 ts=698afa4e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NiQ2TyYaKKJ0CbwNsdcA:9 a=QEXdDO2ut3YA:10
 a=Ql4v02ufxVEA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,huawei.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92449-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C30A118E00
X-Rspamd-Action: no action

On 2/10/26 3:19 AM, Richard Acayan wrote:
> Add the Last Level Cache Controller (LLCC) for the SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

