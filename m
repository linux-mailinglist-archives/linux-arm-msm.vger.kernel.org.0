Return-Path: <linux-arm-msm+bounces-92455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNaoAFn7imlBPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:33:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 259E3118EA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 702C03006835
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21E86340280;
	Tue, 10 Feb 2026 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9iG4J1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3k+0wWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1276F33D4E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715983; cv=none; b=VZAblGcnmb+VLeXtA8UA/RrUDma6axWGJRmx64bQ/R0UkRYMoMv2KGQC0e43JJgLEbTCz7rQvEMilkSw+eBs7/V1x8RPFK+7tPnKXJwKfdUOqsulA47CvRIjb3+ORj5a7PkocoYb87PK5rlnfEUlFrb+U4UoMC8J9S8OPP6TcaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715983; c=relaxed/simple;
	bh=lYXkrcgF/gfCqHIjWikYj3wuxE8pK3C+vUdP+nhK84M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ixxshSs/ycDcrfPdW4bbt+XR1siBXHE5eMAK1A/9+3FheIa4xFpzbBBWYp4EYaLMMD/zXmlZo8b5zRotQajIpoi87YY0bYJQA9xqBrGr/rLsTH9skU55TcX1pvtFjYu+ZwMioQlRRG8RE1lerQyBgceKuvcGTLTlue2G66GivGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9iG4J1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3k+0wWE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A70YD6857024
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLgXJquVUyBesXKA8dBPnaFYAdLbpSuCrTyxZs6wRLQ=; b=G9iG4J1W38x8r1bK
	yNGjcc5L8LSO9QweqAc875s9Kl/lrfPteKjrfaz0Z4iEQRw2Fqqide/Xw0T0Nq3V
	OeJ1GQX9drN9ZmvV/frtuq88//xXMqzD/RAEum592u+iCgAMqWHKCHvbnrIO90eX
	hd6oiwQPLfSCbI2zpvobZPqFHb3bokzC5b++ZxwcziC4LRqHbUo9YZw+MHLCIw/b
	EtVpgkQ/kyPMUFGfmpCIV5YbMwF79MFXyJ9aLPSDxUpLv4WLh43ewasvPdjajc3x
	Z8fYYyiSczCSma7I5pNsdnaRI6RNbruB4JStXmq3SG9WSFm2e33iu5x7ot7kE8HD
	RuVshw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7ga63n8b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:33:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70c91c8b0so210074785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770715980; x=1771320780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLgXJquVUyBesXKA8dBPnaFYAdLbpSuCrTyxZs6wRLQ=;
        b=L3k+0wWERRF01hka+ZTH5p3Cx5Op8220v8WNSc6XxhMKnBYUNGgD3/b4d0x1M0kSLb
         72UEdyhHs8BEIV9o2j0SbdnFrQ6d2FDAF7aHA0AakPWAxS0/eVyMm04Ad/x6FR2LeNoS
         DNSimueaKdrzWbepIylklDHyxlN7VFuuBqluPOQ2ld0EZE0UwQaOsl1WrphohwLH8cAy
         HJ3Tj/U1prlw3Z6zhot1Bk20dmhIf2grGNpRASsr1fRwU395d3EN4/5coTdNRRAcUmBY
         DIrXGckYWY3ms6A7W0hy0x8vsWQLlkoai55c6xVQDXrPRRXXQ2+CqsaIwg1WTsNN7vrD
         uu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715980; x=1771320780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLgXJquVUyBesXKA8dBPnaFYAdLbpSuCrTyxZs6wRLQ=;
        b=CAcvAWZMC5PehAocsqadkiX5vGL2AZH7qhhT9J9j0Ocvz4JrNx6qpEjYINjQIKARTn
         TgrcpsO/w0XNpcu1QsqrJosThlbZ0SXYrkYDStWpod9RkJloy1sHHUhwM4gOMPUchhK2
         pmlGHoxH4eIoLi+8oO9cqfH2Avy7YphP9QEfUlMrdnieDCcw+pPsK4V3OVlYWzPvnuw3
         3mdCi761bfXsjq7jSOc7rzInKvS6NcV5Y5qNygSj6Nvub/hLqXWOoWp7MSPnsjoTfcut
         XWqQ51AqKXTDyaASAipokYcfXsHy6IvpXRRsdS0BCMfGCM0IZVB0QgUTHba4OxHteXy/
         IG3A==
X-Gm-Message-State: AOJu0Yxq/bnWqeaT0i2F7yIuDXfoMGSccQUKwGEGq7C3qb4MA+WiwA4q
	fp1nmcYFc+LAAucMBgaWReAaFUaRCQaFf00M8MsW75lL/iLbtjCEjfOsNOVSGrjktQYVryzdpYx
	qat12vYU5V6V9mSF1WKIgwmCYrOhfmjeWefq5Wq2RSnRR1i9WNMuM0BW7TLGLFrlTezI6
X-Gm-Gg: AZuq6aIzl58o4lsYj6YB+GMIn/0BLOwTjsYILmUH+BkLnS3ZPBtUDhRdBtejlhAVJs4
	BiJaaeJqTYAYYrf+fuZCYJuIGiP3i6uqyrZy3OoGWurhYmYfkvkbxxDlLgzwh9unySk4Kd9hqus
	VXpABOfo8vVLsd6bM8rymOL8824acg9cgWcF8U9RfGmnbIs1jeU7dsjCm8+ZFwoZMqU8+87QOr5
	HuIBeAnCSL63TpC2Sc5x2F2sEQadC6w7EHn47FWIRDCvRWkYecJ56SAKaR/b42OAEyDwNKHdKGw
	7TkWcM8OVWwAXOxo4bw5i16JB+0Q8QOM0i/N44TwYkHe357RQF8c8sXUeWO4ehVaQcW05uJLCA1
	pkpMySMiWeIW29IqgDRQWdpN0z9xPJ0Pj3AW6AdECZMewkRJSPomY6EuouJl4OJYEVIHMGfnGVE
	BvAPA=
X-Received: by 2002:a05:620a:258e:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb1ff5ebc8mr100762385a.6.1770715980356;
        Tue, 10 Feb 2026 01:33:00 -0800 (PST)
X-Received: by 2002:a05:620a:258e:b0:8c9:eae0:d1df with SMTP id af79cd13be357-8cb1ff5ebc8mr100760085a.6.1770715979873;
        Tue, 10 Feb 2026 01:32:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae32664sm489037866b.58.2026.02.10.01.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:32:58 -0800 (PST)
Message-ID: <068a7b3a-22a6-4e83-acef-85353af53390@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:32:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] scsi: ufs: ufs-qcom: Remove NULL check from
 devm_of_qcom_ice_get()
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
 <20260210-qcom-ice-fix-v2-4-9c1ab5d6502c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210-qcom-ice-fix-v2-4-9c1ab5d6502c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -338KOWCS1RFFMTg53DwlOWsOSY3FjGI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3OSBTYWx0ZWRfX9hTlE3nsUfHm
 Uh5t7X908XpRbibWhTmjgQ1rcyfVUcrkkbgzbIfYfLuQO9/Iuv0F98rTbI76ksO6S74zrBc+vOK
 Q+xC7Dn7lEQyhJ8umzIhJgLEv5eQUOqx2bUb9wQZoZgHWkw/UxyVJ40QHjZBLC1Ra/myiqZIFbA
 r2KcM1SII/5Y2XaTElVVHGHW2P9Q/aZgtBovNkIUFic/zsYj9rnNqM/ZL0YmMHAa1GgbFOp05mZ
 QvdhJsyN4JVKzb2b+/2+Si76Yo3/ZJwNy5jTc4wZp+fkGZXEAGfZN6JKFD9eP6dNy6k+8pbZbDz
 OVQCqueDVjZ8fggAxggbv9bRsawMgxNJq3dZxB7ZwVDdxqL/4QC/wyG8GUQVnVLy8ZIPGR6PDNB
 quJHD+wFv9JXEENxdRUSDSNxdKMqD7oFPmAxnATtHmrqER5PtHy+BlouLiES7gGzjuzh9LuLa/D
 CzeCjdg9PPmMGGSvyrA==
X-Authority-Analysis: v=2.4 cv=WK1yn3sR c=1 sm=1 tr=0 ts=698afb4d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=AC2hTCgHVLFjDka4hzMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -338KOWCS1RFFMTg53DwlOWsOSY3FjGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92455-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 259E3118EA2
X-Rspamd-Action: no action

On 2/10/26 7:56 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Now since the devm_of_qcom_ice_get() API never returns NULL, remove the
> NULL check and also simplify the error handling.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

