Return-Path: <linux-arm-msm+bounces-103760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JVqMu0h5mkMsAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:54:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF1C42B013
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA76E3037D44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 12:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF8C34B183;
	Mon, 20 Apr 2026 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDqWVq6e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H0T4ajrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7121C16A
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776689381; cv=none; b=n3u73zTHTrRfhOjMZ96JSl9vsm/WG+Yj0YzQgOpXJcB+TeIC1YPgNlryAgzjKKsKAi1CUP7NiL76d/pTuNzAwccGq/mZrNe6RK1sjtuHKmY0bAI0WodirU1laYsDAVw3PQI7EzTH6uJklWDFl4EDsSOv/dckvGh6XcdZWNKecHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776689381; c=relaxed/simple;
	bh=x2+f/NDMEGO1jcf6OLu43Ay4pRcJDh3q9uE/A2+jBcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRFRQeKdaj9/bZU5yYLg0AjwHCJK75ULwE3iqfzpx2d9TamWscNCfVECkFudwzqNscQ3nMd7pE7xbchtqUvNJWDkqgAK122IUWTHH1wOi0TgjMqulWqhtru/BTGQzgNyUt4Tfmmzq5lZJ4elmGbOqZypjGLQRr6TbBN1C+Qv4R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDqWVq6e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H0T4ajrQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvYeC3015375
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRtwY56nBQbf1x0k86FqJm1BNTc/81FVIoSrk2ABFhU=; b=CDqWVq6e9QRVF6zp
	I4xFHZNE4Mf8ew6c0GXJAZBqfn8efH/FwUwPjuVOGAiLKx950bvsqH0w7qUqzZxy
	vGpULUXVnw8UUBRMSmf8hG+vLjPEm5guU22WI76AmkUcVunMX3UlCTMkNf8ydumv
	vMPf/ecCD4vh2EdqXAUfzPmc5MQGBnGi4F5UyBE/ioGU6dGwzFiXbfpE/eFHNE7G
	2GnuVR5kxu7kYruQzeAaUp0V9wB7b6YdZNmqkj1TyvLcptiqD0HB5QqHW5jT14sO
	xskU90iRIsYrU37rH3IPpJ4L6eZbTEX6/KaeQVY+kkPJSDI+yWieglydyUVSpI9A
	hjvLcw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjukrb0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 12:49:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8c183c2eso29519241cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776689378; x=1777294178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sRtwY56nBQbf1x0k86FqJm1BNTc/81FVIoSrk2ABFhU=;
        b=H0T4ajrQcy9eXGC/KU3C2nMmqsFn2v6sIq4MTkyuZj6SpSNPYLLdOU+fd/+TVBpBh/
         381zcDtIF4hQD3/z30843HNN86NBSUNeLsUD8A5NQyoc92KgFvsD5VgSn8gUMp13JGfr
         paTVSc4LliPs3urSqAD/brDJl15Ukwm9FnTmgdZPA1o6wiRFcCCDaHIRiX5CDKS6tsVO
         VY0i4cVHYifaw2MwH0nKb5oxncGa5VV5uPIWFa+W3kiMZ6zmorRnb2zhdxM18dIgd8qM
         GCRL5fyVhbZzNyCVWX9h7JFtrvKQ/qbwlzIx4ZY1AOplwqx9qtEhw8oil5/+Qldzkwa5
         JQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776689378; x=1777294178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRtwY56nBQbf1x0k86FqJm1BNTc/81FVIoSrk2ABFhU=;
        b=TUbLY/5hV/lZLfg1md4Ob+g9J2qfcDva6tlqM3/BVlXh4RXljS2EKfwnDiBb/maRQc
         V8IrmSbvBeSkvEw0unlWR8llzaAy5GFhEyeTA9MZBPG2RS/1k0awKw4L+gwxtRzUI7gY
         3EeJcHAKb3BdHQ49FwD653ZYE9qj/0uFwLGJKW/xk5dX3UN9N/oWoqpNc4D429vxhb4S
         kAA7QOelVF9vd/S/Pz0MlBT2S2rw6mFFp7+dGg5u58f/PMbUl5r4dl+s2jEbUBOgszwp
         SfkAOM/5bNmY4y4NZ3LRvRt0OzL3F4Evfrr4hmZChJL4VbT15jcxMGdsGfoQ3S0nlsSL
         drYQ==
X-Gm-Message-State: AOJu0Yx/S7mpPpQ8jd7gBi8LXFVuEPF1840p7ERGc4D/R9ca3htm2SaE
	fM0i9qvErVAarGWoFflZV3rE5IdDsuq0QbCpGy/1kTN+ZG3EqYvY/jpfbnMnpwzW1Tn10KJt2u3
	057RSGMm/4X2EzbgeMBGIpQ++yoK3Exa1SnXzpJWdSBfOCnKDdghmQE+ShttGPrB/NbUI
X-Gm-Gg: AeBDieuWctihybWj6AfpKGttBNmJxkYnxMKGZUpqU4v1AvndmrJ+byPPd7kLl+S6r1+
	CX8D6ab2065SqoImXP7WfGSeaxu7reBB88o+gExDqu+R131Z5gzc+DBvEFGlsgAnRFWszOwctVf
	NGLQ/QcOXyFimtMQt4lShQ0sX0C/Wvf+xmrCDlFBSgcp68RgTLT1o7SX684ePJFa4n6C9JwxSEU
	iJpOM45/DX/H+9fJHjn1neDnMT6IDSiGeC+76j5Tgl6KSScJ92B82bLSPZ/KL8gins4CGMiYBO2
	wWG4/uXunnbsMabym+gEzAcRma+8zb/ivdtCuNKcol4OLaLOIOUD4rZunXZ2qqhMLcYpvAZVDxV
	UNUh0tAogtEbVLc+l9I8Yo8hk7csiSzRuipmMoa8n9zcE+nOwXGEtYR++/PpzdpNX8Iak8bb8r6
	EQEv4I77vrxbH3yw==
X-Received: by 2002:a05:622a:4cce:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e3683910cmr123783561cf.2.1776689378441;
        Mon, 20 Apr 2026 05:49:38 -0700 (PDT)
X-Received: by 2002:a05:622a:4cce:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e3683910cmr123783251cf.2.1776689377998;
        Mon, 20 Apr 2026 05:49:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e1bsm350415966b.3.2026.04.20.05.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 05:49:37 -0700 (PDT)
Message-ID: <e956b609-3e37-4c3c-9168-a50793722061@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 14:49:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: qcom: edp: Add eDP/DP mode switch support
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260302-edp_phy-v3-0-ca8888d793b0@oss.qualcomm.com>
 <20260302-edp_phy-v3-1-ca8888d793b0@oss.qualcomm.com>
 <245f4589-d7ca-4d6b-8162-a86972752bd8@oss.qualcomm.com>
 <12e8a8de-49b8-463a-8b88-2cbbf1ab901c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <12e8a8de-49b8-463a-8b88-2cbbf1ab901c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YVPJHiks0JVFSsoPANAdb77hiZzXxi5M
X-Proofpoint-ORIG-GUID: YVPJHiks0JVFSsoPANAdb77hiZzXxi5M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyNCBTYWx0ZWRfX8EGbiHe15CKx
 sLoSxJDIc2zUUoU7wOdpO5ZZORA8GsMltvzrDCqAysP5yaioAewXKhRrCfKbByOCAKt+qGB2dcn
 cpAWIUWYPgHtFFEXo4IVHN0v3Xsd5jIUlTzrqLbvWjndAHIxgNn/aUobdkqZ24bjPM444jU3qka
 F5ynxCl06/dATlCZqc3miu4ve7k24Uj3VFJ840JDdKcpmRh+Y2YCc/dCgNipqSuqaSWEbLY7QX1
 szBoKkOJ8cjFQR3gtyKYNXe72f/edY8PfRoOCq1+eSGHvMB33hKsarJCkDXMC0Hztn8jK3BGXxR
 sL9IFnjyVL2ChN9uaKuT4xGLCWnmcUqC5RiHh0+6VZmOYKpHD3z2Nr4DtStgYIkVD7+27qgYEgu
 QVhSpHpi2Q+PGNmTQ+4cUe6pReGR/q1Y5PzyW5WKKIB+Nq9DpgAhpe8gSBq4l+sV2IIBmdEI2yP
 KFrblRAd8zogf4wYUZw==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e620e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ij7slcz6KMvQTOyTLR8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200124
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	TAGGED_FROM(0.00)[bounces-103760-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RECEIVED_SPAMHAUS_PBL(0.00)[78.88.45.245:received];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,205.220.180.131:received,209.85.160.199:received];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4DF1C42B013
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 2:48 PM, Yongxing Mou wrote:
> 
> 
> On 4/16/2026 5:34 PM, Konrad Dybcio wrote:
>> On 3/2/26 9:28 AM, Yongxing Mou wrote:
>>> The eDP PHY supports both eDP&DP modes, each requires a different table.
>>> The current driver doesn't fully support every combo PHY mode and use
>>> either the eDP or DP table when enable the platform. In addition, some
>>> platforms mismatch between the mode and the table where DP mode uses
>>> the eDP table or eDP mode use the DP table.
>>>
>>> Clean up and correct the tables for currently supported platforms based on
>>> the HPG specification.
>>>
>>> Here lists the tables can be reused across current platforms.
>>> DP mode：
>>>     -sa8775p/sc7280/sc8280xp/x1e80100
>>>     -glymur
>>> eDP mode(low vdiff):
>>>     -glymur/sa8775p/sc8280xp/x1e80100
>>>     -sc7280
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: f199223cb490 ("phy: qcom: Introduce new eDP PHY driver")
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> ---
>>
>> I went through everything and all the sequences are OK.
>>
>> SC8180X will need changes, but it's already incorrect so this
>> doesn't necessarily affect it
>>
>> Thanks!
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> Thanks here.. I didn’t notice before that SC8180X is different from SC7280, and will correct it in the next version.

Please make it another patch on top of these two, so that we don't have
to re-validate the existing diff

Konrad

