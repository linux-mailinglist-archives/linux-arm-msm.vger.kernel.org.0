Return-Path: <linux-arm-msm+bounces-104109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD/OIsG36GmgPAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:57:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B904459F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D8FE30095C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7BA26CE05;
	Wed, 22 Apr 2026 11:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PU2hWyNy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XnPLJRk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713B93D16FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859068; cv=none; b=UrooM5pUVkLZtcq84LQG+q+/O/k4Y69myGhMZeVbdkJkqkDr8VYu37nGIlgK8nU3XAJ6XsThPRTFBym4BjGBfnRkUcJsJL9EJRhKGbitZDCVtL5s2coqQlYfhLudOC8+/vNayJG4kCnnwn6Fk46Q/fkMp0CDnjks7dCAOfy3C5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859068; c=relaxed/simple;
	bh=WZcQ8IgTTdxHEZHy1H9LTjWO/tGD8l+pU04Q2AgAltQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHoIXLrEqxFyOzYfTVXaJYN3+tPkYu2N+1xcqhwfyIXiBpr5RI9ehW6U31SvpQuDPnlow7HTvRiTqUkV1OnLkvSfNedMIk+2pFF+wstSCjpkUZ4YMLi2dvYfHqVDEOmI079yajSCQ289+3kknA8duqAhR1hUZhVU4V18/TdCN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PU2hWyNy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnPLJRk5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MApcpX2123749
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PC10pDiG1jjcR+0K11CaN8ksV7qOmFzw+8AOZycWy5Q=; b=PU2hWyNymFdimF+n
	dpLanGER9FI6kB6O7SXldCo29r3O0JZYCRDWVquVcE04dq263BIHoSjkCPd2SQH8
	/ViuIbUoH50JPwL2ogQTQm+Quzgmm0bOYFWov2o9GVv2r3omD3Xncq75vBqjtpPM
	a2yRaQcQ9PmQtgNZAWawiRU/WNlEr4yQIi0qiIEolt2ACbmWNzWlnXSuEsZp9qp1
	b6R63JIjk4Dv7oyZ9yOlBPZ2+S6byirv7bl37mRjiy1KTYKjA9PCg3oGMsT7/qF1
	1F66oJigp6pz6Os3E4xXq8VNisFTuegX7SmTwWSotb4wu2o8MUi20J/qrmmMS2+s
	YgGA9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfu7s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:57:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fad7b0ae2so8603381cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 04:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776859066; x=1777463866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PC10pDiG1jjcR+0K11CaN8ksV7qOmFzw+8AOZycWy5Q=;
        b=XnPLJRk5B0iBA8iaAfQSeZ6zT/BUy8seuzbRM5sZQ7jnaqq4V5GwHP32KAlRHPdnZY
         vtAu4p249mQPUi0j24LycuPnORnOjzGv8sA+/icFiZdMNufC89uAi+rX4l5jwdcq53Z1
         7X97yQrS5DuPwJ30hB3+TzpFTDK4DG7kdvR8moFpwsn4N/QFoFATVjq1BvGISKrnXyVi
         Cg1Nxl/6wdiAFStouQfCrwxVrMFOaORsMXIiCysgMDkoKes527tfE6eeaNU56Wk9RLn2
         Acj3xexFugHYWK25yePl6cA8tfJwJzLvlfvBWFnGImBxfZ8Pqu7yC4khaS95Sjp/BFke
         Wgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859066; x=1777463866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PC10pDiG1jjcR+0K11CaN8ksV7qOmFzw+8AOZycWy5Q=;
        b=hDFN+8jAv2y77hxMxvellv8M8tyXbW9ayQCkf7KJB4aWYL2BTidB82tdoTvdLaz6xN
         /BH6whLPUmb8Ja/2ab8S/PLnjLcAJTb+Wk99g4SQZw5Z+ZejXn2TaEDwAtrIqcuZwfZG
         5DTs8HG150Nd2JTs1xQdlAKtwZfc5qDIevayhzLDryabOPTAAldSntua71pUs0T0qDnZ
         4iPO/rOS5LZmv7SLbWolQNoO1DiQ6meNXRADZMuDZzPBN8JxgmWy9oJNUNuD6R0i2G1N
         aML7wOxb8BfJ9krT7YOu/7NDKkKiXyOEADJ5gmBbg0CA0AELjnV6Bz4oTRFXf/HgX2Uo
         JfUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vL0MpWF0AIPbYRmViiQaQvXKJd+mN1j8rSw2TtP0wCwWWDiYlCYUOH1QBl2VzgabvTWFeWsnyMIs7Dcc8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9L5jdmRbJzvTPPcEotSXWoIl2zwVcJC36BPK1aDHeDKKgEK0C
	I9LIozUhxT6hCESRpo88MHbH+/KwbD7MmDkr4x79p+JuQACsjLgdiu1/rK1bT1dmTQHNqMf/XFa
	Rzm59yQl/mkLc91nqhd3s2dQ0H1jcn9wsAXZY3NSIihNJh/3PTz0UkeliPOLGYoqDeAA7z8YEdV
	EC
X-Gm-Gg: AeBDieuuyVKDrjDZmtfmk636SPTd1Uv0gb9rnZGuvBT0ea06YfP3nSN74FtRl7rw8ua
	v/7iRWHEwmR+JbrRViXx9dZEuTstEm1fLtVKOfH49IQP7w+1UX5DCyvuZTq0bEAS6SMDVC3LtTh
	KFpQNsTL18Xtr6q9wZDonZB/ku9a5pYSojn/ahw1reyCntlCSmzkinhyEgVTRsGQsa7LRUO8omj
	rPDGFe5HTEe9xm2z7UdADusgzxWH4ehmw+nav4jdqSSCmaKgEwDzpmRW+RzV978oe9Mi5yvhtw3
	YXEbyx5Blrtr0/tBcYyWpZy0ai67hl8dbu4tLhaCzEwQA1ul4FP7sx2R0yIQBVZ2L51Bue/YYA1
	GRtmb6DT7BK6gNLc9Rmcm5rJ4EI7MycoEcbM2xF0X2KNgZvsUilhNmt9zUirVadt43XazOMWNpE
	1xYWBC4apnlBnZ2Q==
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr222103281cf.0.1776859065781;
        Wed, 22 Apr 2026 04:57:45 -0700 (PDT)
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr222103061cf.0.1776859065311;
        Wed, 22 Apr 2026 04:57:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm546618566b.6.2026.04.22.04.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:57:44 -0700 (PDT)
Message-ID: <f578fb1a-5087-442a-845c-db07ce3a9931@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 13:57:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add interconnect provider driver
 for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
 <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e8b7ba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=miiGjHqzieJubTSf79EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: qlufRkLtDJ7om4C2soZJFfBBhezRjhDs
X-Proofpoint-GUID: qlufRkLtDJ7om4C2soZJFfBBhezRjhDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDExNSBTYWx0ZWRfX7oR8q8gfMXuG
 641/dNtM7qraWD2tvRayuWXuAv1/s+V3OYbqBM2ye2XvsMdHZB8aNuiDkPnJUyk1mJj3gBiuqVe
 aokWzIvzrwBnfRw0H1tYwk5CkZgMWjgtoaalkO/Ixxfrq5+BQ61xcjrJRP43anrfLD39Hz+jQif
 YER1dlu9PqkBDqGKSxYFpmrflhm7SBUwc8M45hgZemmDfTi/W4UuySEx6LKj1R6u+6N1i9hqFdO
 NFUIC4LNuip40csO+ybs/9n0jqtRNwyMeLXqnuX+njVNCF86KVX4fq+lOx5jmxs1y0knOc2ayug
 07r2HXtrqMnfjqdHuFfY2Y40ady6mpO/a42QS3iS4CDlIkW8BFAhMjKswqBD2HO3KrPaq4smI+Q
 95ALWpMGjSgArKEo0lNwP7Ga/QmWsTF9U6IhdARWv3UGMRkCoQstCOvOb7wkPkNNRsbf3Oap9RX
 kjUEtOr0zEpQn2COcaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220115
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-104109-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92B904459F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 4:13 AM, Shawn Guo wrote:
> From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> 
> Add driver for the Qualcomm interconnect buses found on Nord SoC.
> The topology consists of several NoCs that are controlled by
> a remote processor that collects the aggregated bandwidth for each
> master-slave pair.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

