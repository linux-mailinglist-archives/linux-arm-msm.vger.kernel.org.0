Return-Path: <linux-arm-msm+bounces-92668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBvgN86tjWmz5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:39:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C06B12C970
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29F6C301CD84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993DC2E62A6;
	Thu, 12 Feb 2026 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Az+AHIJK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZgYrrkdt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D36E279DC8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892744; cv=none; b=U/JEs5FkqY6KsOHoUo+rVGtyjkHKdAgj54Ws+sXBBJMbDgJagn6DvJot1z+pXDP54WzIYHra8b/PrgQYxW+oybS95M4Hx2lRVgJPjyjLHMt9enm5ofb0ToPxwjOkyYHpgv41nKw0eX9tWmftepVBGakpoBa6jFd9pw/pGyhcdaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892744; c=relaxed/simple;
	bh=IGF4G7Q16JRMSwrftPl+jgfEScB+RMXUNFnD/kw/6+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhc/I9vQ8D7zs/YRqGVhvL/3BYXKbYfc+XAGJvdgdZyzjH5uQIG9pLJjEODxnFUwDsEzRi12xw76nw7QPZbA+P0w4uT10STCc0AtDsgn9ASQRe6w0Ms2igkGctjlxoamCn3m2r8rsnKLHz0qC84j9arbgzjzroye1FWLKP4S9HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Az+AHIJK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZgYrrkdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAMEGa3887977
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGF4G7Q16JRMSwrftPl+jgfEScB+RMXUNFnD/kw/6+k=; b=Az+AHIJKIlRRQ2rR
	ztWYSiWW9tXiZ/EKjbpBwuVMlKp2nafgtS3sxrm5tNhli/tT71wcM5JesMsOftfq
	cxWnsWqJE5+y5h6pIGZsYrI1nQb2yvfRbaK+Ue0CR4oGL/LZPER8XrdfFEGZmUsW
	KGplxCj3q+tVdAAd7bPe0UPJdW3U9In1gmv7+h8yXhpQWu5yHk644OIVq7TK9Tsc
	RvSebjz6LIp+g0qMzNYHyxFE+2X/X5ARekcfBtpeLiSxu+d2WCMCb9M6c3Fug8fn
	av5e6yiI18M+1JjZDbtu9o3G4F6sgllILAYWd9NyAqljd382DtLSKaFE4cVlS6OU
	kvh3sQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c90wja8ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 10:39:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896f7c56f10so16117776d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 02:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770892742; x=1771497542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IGF4G7Q16JRMSwrftPl+jgfEScB+RMXUNFnD/kw/6+k=;
        b=ZgYrrkdtVEczq2N4sx/qxpmDJycDdsmLbtfJ84Lc+Liafz2phcX6xdNASot0HAmu0X
         IEDC8KF3Jv30Dz6otRYBYeBDEJT3qxhVuEvhEjxn6GKhtLEJC4RFoemfaPtN4rX4+vmu
         5l8+CimapnWHy/E4CIIwuVvljKzy1Q/RUliBsnhwlASBwFRwZGk/MSnuAksKlU7lZQbU
         pcnmtUBfoRcWjfnGmA1VU+cAGTYDouBI4fpbYpsL/szU7opCe7lpAAiiYMkRyaThIgvz
         pmRwthxOsC8rhttITCZIEgLXwOJ4IT4d31f792TlAWBhxb96Din2laAH1XmEH6FqGNdT
         +39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770892742; x=1771497542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGF4G7Q16JRMSwrftPl+jgfEScB+RMXUNFnD/kw/6+k=;
        b=IHd7T5zNE3aeYboFqR9MwY90TwT6uAzyXrGIuuAylXOwpF4iuaKLJTNE1EMWwlr0Y3
         aFDxlmbWd+N/f8uokb1u8shYCmHZs1DRl5GQMnyil9ahUDkjQENEEuceyyGOdfXBAFvN
         EsWJwCtyrqFUHj7nifodLz8sEttYMpCHAFiOS9aUYSV0/+M6gIwSfO254CakkIpU9pw9
         DiOiG3uze8jfFRN8LvjcZ0KGgM7FatPplGNg7mjXAUIJtkWvW/PpGXF1vIS12QQTeTJj
         7MtWUc0iCuCVaK3SlmnaTv6deKWhtKIEPGARLT6VkmkAc4ohdD2ai8O7fnVFhoOAO8sz
         p4nA==
X-Forwarded-Encrypted: i=1; AJvYcCUf4lnQd8600NfrAywHY6Bz9wC7vRfHBQ476G2C0UavyaViNkDxsAcUvfDk0BuB85RcOhrhbKW/yhXXXKXi@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2dIbm3DYzdOpt5TzWjDYYZ79IMlA4w81M8QOw0iyk52bXFZi7
	MeU1RvBUCQ23n+tL0/PN8ZC1u+kpWTpmKULSN6Pdqubhks1S2nI6w6e8KHMiqFGSvV0C+h49AII
	foFVCqnJFsJngGZYsO1m8KZWMNEghujNPX8LE+8zNmnV6osg7vPeGyhuyB7oFX1Tifscl
X-Gm-Gg: AZuq6aLDRJ/Ov296gu6fEM3MGe6MK4IK/DvUQPbZLwwfYu/jWnI3p4Y3IEtAc4R6Cw3
	5d9MComzJtFxfe5fHLnYl9vT+WtTc2Egpq/zdONl0LodNczyImomfRkw3XBzW8H5HH1Cql3m5HM
	KdrEVb6kbYXwYGGS9vzTAl3QJgfeOiUWOpzixDsSIWdWMBaAJzmhGkl2dT2yXP9u6WR/StZUw0/
	SMnhLjzJcfGkxiNh8wgzq8NsXfCc+sVZsmVbb8Ta9APWHY0wh292+EYH8BQV4bneGC+lWl3zRt5
	E3fDWakAZFHFaZuTf8xc3cWssWDFFxODcqGsNERXU7e6B4WyqKcCc2lrgAwAqhbd7OBDhZvzE4O
	uUHf8lwriURjpHR6/YSNqn5vaazOnQbSvHLSnOLh1Kk5FhGgRm9ygCljFzosFYUGPFiEw94EiLP
	ZS2M0=
X-Received: by 2002:a05:6214:6104:b0:894:9d67:7329 with SMTP id 6a1803df08f44-8972793d999mr24553056d6.2.1770892741810;
        Thu, 12 Feb 2026 02:39:01 -0800 (PST)
X-Received: by 2002:a05:6214:6104:b0:894:9d67:7329 with SMTP id 6a1803df08f44-8972793d999mr24552856d6.2.1770892741444;
        Thu, 12 Feb 2026 02:39:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cebd31asm1589459a12.8.2026.02.12.02.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 02:39:00 -0800 (PST)
Message-ID: <6bf4b94e-6ec6-465d-b0d8-0506860afa6a@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 11:38:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rpmh: Fix LNBBCLK3 divider for X1E80100
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211-hamoa_ufs_clk8-v1-1-b537f54e9353@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DtlbOW/+ c=1 sm=1 tr=0 ts=698dadc6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=ly4eFjZ7uZWBmfg-hx0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3OSBTYWx0ZWRfX7Adpax+hVgOQ
 Jr6Fy88cEpFRKp1A4zTKCQ+feMwD3IDX0jH83SPzClSs9mFIDjZED9tznyxikUfGBLnWx02e//L
 AN0pgAAdNrb3fWjxtIVFMgI62wibHnWKaS+amw6mluMEUYzVn/pV9lbgEsAWL4930/qjzFURXNi
 /xjsmCwRjYYOu5u0leQYC6fdNr7W+lhbeXqbjWC0ogqYo5aKOlfN5O4d7ytuAb7UOPhZbbWCN1Z
 nMt4dP+bl+V/em4kXovmPK1rCZ0J0UPuczxcbIPYYJNUWsCto/jkAaB+ZF3kpPfa3wUnJoURDjv
 qUyADrflepsbwvxo969TBbT5wDusfAMyCvmSEDa5pGEAIInN77oguO+X+gmTAWrVlLg0QLEkfuu
 CuMEcREgOibUqeJOAsg/OtdtVYNzcUaRHkJ1aeiOowD3fm24asljvidgFPt6M3tpAqNC+84dsPo
 a1pqKtuJg2lVsvXQJ/A==
X-Proofpoint-ORIG-GUID: yRM68Lq1oPeG_YtkWOSyVxtHb3rNOSch
X-Proofpoint-GUID: yRM68Lq1oPeG_YtkWOSyVxtHb3rNOSch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92668-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C06B12C970
X-Rspamd-Action: no action

On 2/11/26 7:22 PM, Taniya Das wrote:
> The LNBBCLK3 clock used by the UFS controller runs at 38.4 MHz.
> Update the divider value to generate the correct output frequency.

Does this also apply to e.g. 8550 which seems to have a similar setup?

Konrad

