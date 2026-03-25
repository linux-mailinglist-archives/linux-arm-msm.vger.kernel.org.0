Return-Path: <linux-arm-msm+bounces-99849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILSJELnMw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:53:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F1432441A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49485308CCF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF713CF03D;
	Wed, 25 Mar 2026 11:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fivO+lZt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LdL4ybDU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FE23CEBAE
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438599; cv=none; b=N/JnFlzMGsqUNkhQz9Bn1wEIIbcvdVxN2mA0egw5QzL3zOol0TF13av3+66b93RZjbxBOO5lka2sajgytW8UeRDbWr9u6/y6s8jFRC7TJDe9mLTMmS+kPN7Y4eV0q2ls/wKYKF1mAGCEqRSVaO+0lUt9Mxgz1h7F1Mq6QQ3HMYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438599; c=relaxed/simple;
	bh=z+8i3GYxmPysMPaCb7ZxvnZe2fGGVA4EZxOB9hfujIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkCE6J78zR4yNXhy8T2wUFFXSvsT0Bx19XMOKH8BIS3ORG3Mntk5LYGDphdaydL6cJW7EoCZIha/QWGKTeR8KbH+CQjUey2a+L6Mf50tzhe6yBtKjtIXimrS191y9pU+jGppPv6TXuiva4xvAjEJhf18i8MMilK/pVV1/Dv8Z2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fivO+lZt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LdL4ybDU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGVnr1895857
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCdNH+n+g6mJ9mJTkyKqJkhT1JA5zvNKqGn8D4J1dYg=; b=fivO+lZtWQ3iroMH
	Czs7q6AyDLwyV0ZJVVbIywxPWiA1c/F2Qz8tVdRekRFKX7Wd+NIXGwRMteFbPAF9
	WwSuQ5BhHBw4jylxharxZ1bG49i19d8B+YWeaFFRWljBEpzt8Iw8DHT2WhtEOZz5
	KQBOYkd/5iX5ru5qfDl8Cm0kxZvVCcXCyZ6ohF8zyY291GFiHV33/Upw1k3MinE8
	LDXh5MAaxgVxACL9P2u/D9Ao5KBFM+PtG1WWOqSmDKeEoA/ZhqY/mAcmV7+hzCGZ
	Lc6o3Dn0ukUqC1vYudr2TUB9sCdZhIG//CaGKnFlyt2t6WQ2/tBXWEwukHeF7E1Z
	MgqTaw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mhk9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:36:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937cf66b5so329587131cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438595; x=1775043395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DCdNH+n+g6mJ9mJTkyKqJkhT1JA5zvNKqGn8D4J1dYg=;
        b=LdL4ybDU46khP4GsIkNocBsQRMD7pC53oQJPIjfvQwG8U1+sdIBlvqPU4Ncce8WBZH
         U2MXjGn86Xm6zij8/sWoVIUBUAQIaTv6SQM9TCFazwt44xP/hsnIKKbtfgQOliQe5C7H
         POSHhWd0h0UPHe+ucQghZtcRiYtpOg3d403sy/q2leWgQELsBPJmS1e4Yh+/aYhCXx+Y
         mnD56WrbF86anLy9kcIe5UwkSv/os9LyoMAN0QGbbP05fUroJi/nHw3rgvrW4IO4vLTx
         TOmqtmitwM4nrML09EKL0Egl2Y1ee0EqxzTOyE2qqqgBwS6d9HwuOawqASc/FXkWYkbh
         Ex5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438595; x=1775043395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCdNH+n+g6mJ9mJTkyKqJkhT1JA5zvNKqGn8D4J1dYg=;
        b=K2NB1liaCFIytvcfzTEgnhaCojbkhQzF57fGperKMIQWrmk/JhhP+rZNOFnA95mJVz
         Yd/u/v9TtB6kLLNzqawF7P4+qVhQiKZq5xo/j/OnYhVACK3utSqZzs3zaXanu2+V7fpE
         8BnXYyFKEmhF00Qs77OEjHz1On03/ga8nPlvgJaod8sESx/smsN04XRFyFPGq9DUgW68
         aztSgQqjHa5OSgr9b+WDyPRQ8V0cynz5H1n8MCLzEgKGxSzNDtca43ghxYpUh/fQxJoZ
         BW4ZxIevHyvcLKFHR0LzCoCV3euFAUCm0KQyTZ0QSBxpGlSbDt1ogHoNO6W8fZYT/VYY
         sHng==
X-Forwarded-Encrypted: i=1; AJvYcCXlM2j2m3I1V0z6niPSJANxkdShYcEySGVCjZtMu3neipm5vUQK/JexpUFt/5Qt0t+Pbl7NFCeAoztii9wG@vger.kernel.org
X-Gm-Message-State: AOJu0YyfmKFPW3vlOM1hCrbl9Exw3DDTr9r9gg1aw+7qNQuKgsfVirAS
	cHXxQ+U5HORlvhoV1jG8P48jnTLEACeTnAoil3+XDOvHHUGI2YMO4kX4VtLQpHbxGcdcBfX9gPh
	9fTiRbgr2jMkTvy+3DL5oPUid9Td6PrOS0cblT2+zm9gFhCxmfDlAlLGlat2WcYNOCpJ8
X-Gm-Gg: ATEYQzzULSPNZaeZvhJxe+QVlIeb9WcxMPEie+pnsUV5JmZFWqSPhIbgB3nvI0cJXKF
	Cuv1GqdxnFsOlnXe9e6wEpO9mRK5G8uZy5LUTPsYKBSRbB4eV6hDDL45ZAREL/o89IjLGEkZtXA
	RuvMVUaVuDUmSW6EEWxL4TQhEBjkgC2DGxA+ZxgwE46ZbIxchrDVWFcvXk8vxyW9VQA/KIeuX2a
	RUVPnuoz+jUiBulK+oN18IebVOP3nVPZ7jh/ry8dwyfPy7qhls0aGWOCRzR367lFP+YN3HxCmjq
	PWZ7JtboS2wmSYJm5qJaI1DNNvHB8i4MSGO64l8RORq866upM5x+3HbdGnjy/QcnNJGIrRVWCEG
	fK5pWdwUUdIcq0nVUxei+7De8E/ZlOmy5lkNvvJ0N+Zb4hT9N
X-Received: by 2002:ac8:5a95:0:b0:50b:4491:a2c1 with SMTP id d75a77b69052e-50b80e90f59mr47306521cf.63.1774438595517;
        Wed, 25 Mar 2026 04:36:35 -0700 (PDT)
X-Received: by 2002:ac8:5a95:0:b0:50b:4491:a2c1 with SMTP id d75a77b69052e-50b80e90f59mr47306041cf.63.1774438595091;
        Wed, 25 Mar 2026 04:36:35 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-487172f909asm25777975e9.6.2026.03.25.04.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:36:34 -0700 (PDT)
Message-ID: <544debd5-bb7c-4b89-8641-eb63a107155b@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:36:33 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/13] ASoC: qcom: q6apm: move component registration
 to unmanaged version
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-2-srinivas.kandagatla@oss.qualcomm.com>
 <981a6253-5005-4281-88fb-3ef6361dfb76@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <981a6253-5005-4281-88fb-3ef6361dfb76@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfXyusJSI8Y62Nu
 j792cgwDaBs+ngSSkYPks71TdcEn3/4ji+Ga0kqJgTQQJz6IwCU9+rw0zvKg/H7pCkHiILukv7u
 YFBLl+QSMSPL7LFRLeE9wg/5sUFvX02vWPVAIRS8JptLRqN/n7zvPvLy1VEy9icmNVUqm4b6xBW
 x8Ki9FKW1W0Zs1ndIiZmKNoW2nH6yDvNkl2FO3PrxjDiqDE/EIHhwiP+GsWeqBh9K662y09ja2r
 Yvl/AvsN1R4WLrSMYIKBozQ7oAoySEpmwn4CfWay7xK+ERoQU8KfsY0/pDSoq0w9Us5T2srv4y9
 pPwLkRV3tTbV8yrpjVj1SIFr7ts5yDUibRbRirmz4kwQ7BVciDa9RrX05FTlKbRrdACtryS/Ja5
 HeuQL2PJSACkZ/mpIERZ9X1F+gUprgUmiDt/HmdRdoAijs95Da3a0TfXZB+d9D/GwB2NV3jUDVz
 ztGkGX1eDmymOD42iKQ==
X-Proofpoint-GUID: QUQ5odC4-BepWfGnHzSA4Nc5guIMlomD
X-Proofpoint-ORIG-GUID: QUQ5odC4-BepWfGnHzSA4Nc5guIMlomD
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3c8c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3rt7OP6hf4PjYIihl4UA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool];
	TAGGED_FROM(0.00)[bounces-99849-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36F1432441A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/26 6:04 PM, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 10:38:33PM +0000, Srinivas Kandagatla wrote:
> 
>> --- a/sound/soc/qcom/qdsp6/q6apm.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm.c
>> @@ -747,7 +747,7 @@ static int apm_probe(gpr_device_t *gdev)
>>  
>>  	q6apm_get_apm_state(apm);
>>  
>> -	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
>> +	ret = snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
>>  	if (ret < 0) {
>>  		dev_err(dev, "failed to register q6apm: %d\n", ret);
>>  		return ret;
>> @@ -756,6 +756,11 @@ static int apm_probe(gpr_device_t *gdev)
>>  	return of_platform_populate(dev->of_node, NULL, NULL, dev);
>>  }
> 
> Given that of_platform_populate() can fail we now need unwinding for the
Yes, will fix that in next spin.
--srini
> component registration here with the removal of devm_



