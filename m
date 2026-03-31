Return-Path: <linux-arm-msm+bounces-100970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH2iF4OGy2l4IgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:32:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5AE3662B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:32:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D38253010BAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AF23DDDBF;
	Tue, 31 Mar 2026 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBdD7ozU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDgfrfEX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A853E0237
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945656; cv=none; b=ikT12nov2MfXMc1UPkX80wLKroOhj4iKxVR4lRbWfevA4OHp8qLnflfcJ1CGccYYSWmCImwmnfOiClCIBpQQj9KC8xZ5OIBFM12pQfpFH6Vr85fusYmBv00mk8T06h+CEY2B3dY3pYNDOYwb5TIHnVHr6sLbDB7Ke/fdGhTuQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945656; c=relaxed/simple;
	bh=kKKriipUH+u55ee/pJmVJsjEekHmyqx3MqIpuZqRg58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MeVYB/LG+pK5f7MFM6uXVj/etFSSWZvX1U8/bBBQTh4Cr/sGdM9hndH4s/utfIhFtkj/9ofrhuS2BSgAQxcA0SjAg330obOp0S6FbHfCxpY912ZrliydO3KkLU1xkFGRS1I7AsY/R4HkCZQfZ4/on22R7ocp1FNqJg4e12UeOTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBdD7ozU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDgfrfEX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6xuat2164264
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jwSL7BBBHmJtf0E/zB/kUQT56TKlSg0bDSjBz4GFIvM=; b=lBdD7ozUbSAVuDuy
	PCyd/t+QUc/SYlPd6JM7WztVYvMQtdqh9X7IVUB3a0aJa+oyrj5ghDTTUv8pgiA7
	bnNC3vTSATpe5qsMv+SI24vU/NB0ezFlnn2MktBg31ZuKAy2pNqLntoDd7L9FJ1t
	L2sV8sLBJaW8W0SOT98alRl3Xfokn/JTVRJvBVOq7Hy6zn2M1/SdIyZWWp1/EHLb
	tMZ6SgdfpTiGZxCbP2LI9lnjyRL+DQgv5c1ZmkcevkAYDOeCOxQ/n+cVMualYYFl
	Dvc1nXr9JLRR+9k3TcPMIPZRWIjYrxZABs7w89h98WWaAoGNcTMwWcfqGnw+Gibl
	0jJqRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga0cjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:27:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfe29579d5so210503385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774945651; x=1775550451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jwSL7BBBHmJtf0E/zB/kUQT56TKlSg0bDSjBz4GFIvM=;
        b=NDgfrfEXYESFHQE/aNKT61xkShz+w/pOcSOXEg8sQAaw8vuahP2WWdi/dmsCYMX1fS
         DTxlOW8eTqmaamWE/aqDLecsMx+HC1SOn3KWyBlsiolz258ibsrpszdjna2+WxbxtaOc
         zYSD+ZgrmTGyAa9vSC9wBeHTjFyRDPbCCY/q7rrUjp/o5wh9K/0Wq71CWehlsOzGC1R1
         wH8ohqbCOqqC8iaZY8hGKHPwnGf9dwtqOpcHDJwDVkcMQo0Kx6f+Os8sE/vFaDv0MZLy
         0eSWsE9cNyvnvFNAXZ70odF9kZEIcS/VrInMCe/Ep0XNcc2pOgH+7a1DRAhzw17/qczr
         ursg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774945651; x=1775550451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwSL7BBBHmJtf0E/zB/kUQT56TKlSg0bDSjBz4GFIvM=;
        b=M3eLfFlsfgsYFyRzyguAL19MnL5xdqmI7dhyBTKQpYL7eF6Ma/JzMdDP+pZPH1xQ0P
         O534bPp6Ywb/xKBpo3NUDBJdHRbTHxh/lWz5qEwnZ3aWDL+WIeFnqAWw798mLOnaY0Zo
         nplJpB7lq+otBaaxB5ismWYj+vy9X91SwErVBs+u+Q53HACpxkvAiK5BnmF8S54AXW8N
         syUXpa8pAp1+tDlgXVmKQ0ECcZH3JwAVVBrqnCES20F3GOs3c0lczQDfsb7AE8qa7EXa
         Y/c1B2HuUWlxiItTYzvLSHBvBxQt7vEqggF63iK+KzurSDkOQJNDKDp6f6D94tD2QANd
         vb8A==
X-Gm-Message-State: AOJu0YzztLT2fxnSuEcYFH5UR61wgXNjyrbdkAoA+nDfZQGGM0nPDPW3
	9jKJAfgxLjHu5AsDQxa8zDXuRZfeNggIQk5cZgx5wrPDDzpI9gSvYN83e7KbUr5KuKW5ybslXQq
	0Q0TcUt7TR5q1RbIHTaISJ9bqCBXC9CwR2fdNr77017CtyYcQ91Dstcg3y2P8zFMYhdqx
X-Gm-Gg: ATEYQzwSuBEstIg6/8w5RhQpx7oXeXxwabaFmowcbgQdNzt7HpmVBwRX+ktti0bWp4D
	6+uR9LjAcf2OyRgSZPjYI1czrZYX2sHJUy5VOCLsM667IMSyCizso1Y9yeMqT6RZyS+5I1N7fxM
	OFwjc6SU6pBKUqYTnOMyfaeaTbPpDKkqjUAR2TXP9J79uxXNARIheKP3xe1qJEQwSQrNGpFKIEP
	fCWdSgyOJg6unM95WKZ2xCJa7jHinV9tF8YiYqa6rT1BzIDU6DavJ/+WkokOr42wQBY7yA2N3p+
	D1CzdE5DosBppg0ateGvafwj5urZhnQnZ52+ayCyqSmvQATiUR+/i73ib0fnCXQV6xHfrGRePt5
	2fzf4liSlzQ4NXCOvDsAon4j2UanBVCil1zI/d07aboXqcLP5FNhIyBS3RRROF0b0lIqJW+pxCa
	1MWwk=
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d01c7e1cf5mr1557342985a.4.1774945650678;
        Tue, 31 Mar 2026 01:27:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:8cf:d289:d0f3 with SMTP id af79cd13be357-8d01c7e1cf5mr1557341785a.4.1774945650281;
        Tue, 31 Mar 2026 01:27:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c5b0f5c6dsm154411a12.15.2026.03.31.01.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:27:28 -0700 (PDT)
Message-ID: <5f7eceb9-2ced-4836-af9b-ba267070e707@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:27:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Enable DisplayPort support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260330-glymur-enable-displayport-v1-1-1543ad6dac3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cb8573 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=mgjOwgaqgkQbYHjcbWwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 99zawaFLWn8Lf7u7er6muXygRuzFSlZv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA3OSBTYWx0ZWRfX83jwGIHw7aSE
 VqV0b6kepaj7Tn6tEOJWQTj+O5Qo2ysYr5s7mIyAF+IKrX7aG8HUo7pahEC2JLVXSPvGpGEpJyu
 UZ5HUAw/wOSJYhd17uyYXHRuKyvvlm1wInRs1L8mxhtn2IPeX6XvAJXXWVZAM1aFdwvrGodo3zl
 Ju7o6+9pcF2DRHSZAS/EOD6CAc9JFalQtimangKAbsSeH7qXBl4/D+DSK5BxZ5SvIihhRBqdOiS
 2h1AQWmyQEg6pp66D69y4y9dkQ5lprkfeVZd2nA7W/l107lCotPxamrZAc7PYQLSyWjjciyElOn
 8NPc86A767Ye5iNLfAUxV36zRZKejpUvx9TBeAUyc55AXIcsPQoyjLp1g3WdefVuqQZo6UVgB8+
 Pn26Tcijjw/c+n2XQCpQGYAzJT1R70KRAgbp9UNK9srKIcc58nRgjH/tuKoL1TyJWyRBIJJ6pLD
 vxd4rNpd8LEI7Qkg6tA==
X-Proofpoint-ORIG-GUID: 99zawaFLWn8Lf7u7er6muXygRuzFSlZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100970-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB5AE3662B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/30/26 4:24 PM, Abel Vesa wrote:
> The two Type-C ports found on Glymur CRD are DisplayPort alternate mode
> capable. Everything is in place already for the USB, but for DisplayPort
> the controllers need to be enabled.
> 
> So enable the related DisplayPort controller for each of these two
> ports. Also define the supported link frequencies for each output.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

