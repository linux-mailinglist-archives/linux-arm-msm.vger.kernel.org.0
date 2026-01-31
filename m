Return-Path: <linux-arm-msm+bounces-91368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN0wDIfrfWmsUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 12:46:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82112C1BB6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 12:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94E96300AB05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 11:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0ED131AA81;
	Sat, 31 Jan 2026 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIkHdyvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ok0HNmP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039732874E9
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769859970; cv=none; b=Si2tMRrhbYGUAFXu9hHut+yOOBBs4FrpoScIOucl/pmcfKavydDF07VtBPE36DcWGj/nntkUi/yuIPi3EK7YwRiN0mpWjFBq4uh44hS7aOVe7rNZ49dMjh/usNRQqn7fBKWe8ne3rgsrJux45LaijWOKPJu6N7ZBSkeTmWbrBFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769859970; c=relaxed/simple;
	bh=UaSwpXA2lLpvPzCblja7+d5HOZuOkbxAfMPi+r6Ojts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SP3dcSFijlnQ4/HzY5xYftq4yJA4h5rkyDHfXafyHawN70DvtTZQIjyvuwPYIYccgCzX1XNRJLEyZ4R20rTQjAmidXUUmf1nf5dxQC21Oh2dPmPYIsYyQAqxdn/BYsl6Fa44pLFpaajfORTP0aJVEkQ/V8niR+rIH5aus2A6DHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIkHdyvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ok0HNmP9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4U2pu447972
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 11:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6u0xoNNxZq/Kq4q0yf8gG51zhFYWc74v8speF7/QBe4=; b=GIkHdyvdZnAjFSfJ
	Mft2eiwuFoiNpF/F4B70TKZQDW/IWlNpS4WIPCkQwsCh9KqV2FGuuQDfl+jTPUiL
	bxYxM0tLCPXstaop6EM57TA/Zv4o/WLGb+CRkU/qsHnjIWUsg/Q6SHeUkhgBy0kb
	Mx8KLajGsoOmwecpE57/jOM7JLzzqDD85LV/2W+tUiTSmbqq0HtHYWeVISbfPKtn
	ESE8FzrEtwVokAv40naHarXw+B+9XFqWZ46QC+acQEV0k1DT+21mB3RPoy5jFaRF
	HPjHYQ8du9vRr/ttHHwrlfYfUAnV57Cy9Q50Y1BXvov2iYy2xXcpAEnh3IgphFo+
	6RqE6Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0rqrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 11:46:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81ea3358dd3so2599361b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 03:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769859967; x=1770464767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6u0xoNNxZq/Kq4q0yf8gG51zhFYWc74v8speF7/QBe4=;
        b=Ok0HNmP9zfvKro2UPMpdBpJ3KW7DYQGlZE/qOKpnICx4DSptgfdS9KaMGVqPlWrUfS
         857fAjjI/mMJqvUv4r0xW9NHNY65pD3aEZ2nP9o4A5Zs4udP+QMCqqHG3LOwkicbeRpH
         V+abov7jiuMC+8pOWwol7bxIQdQ+sHwJGr4YZd65zMD+HorWD2MGfxafo0HH1Ie0p3MN
         i71+5SsK9KAQWk1/O6GEcWLhpCeFH+rNdUuCFpVW9Al7Aoh9JpMRwFkjrU2r853wXJSe
         L6RtdBPegZLsGusDXfd29vjcMwzrMrhY5c1O4s+k9KPEyJrfr2vgQf1ymvVP7x53NUAm
         l0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769859967; x=1770464767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6u0xoNNxZq/Kq4q0yf8gG51zhFYWc74v8speF7/QBe4=;
        b=cZZmSmErdYGtC6YtrH1s4HnKwN8/qc1yOizg/nEq9GADD0PgCzvFPNcX01hCD8iuLV
         RDiUN4+H/oc+lNcGzSv/KW2uRvjSWc3rNPSQENoGNYgiickTggwcRVv6uhWJYM/2Nls4
         V0YAhvMrsiIjzdfASa4OXy4mZYPUGuqv313KTah0eXDUgR6QBviJ2yH9YeDucGLbfq5v
         b4Sz6qrx9e2CaQ6rq0ZgzcsTfYIIrunPMTlDtJpM3fTJ+XPW+G4rLlOqVCaYi6sssd4e
         SoiTZ4vejbxSPypdbUT7U7bU9mPkgLnHAVjH/SMJGfXlESGgKbgsVTbw6iPI1oAbQEQe
         cWsw==
X-Forwarded-Encrypted: i=1; AJvYcCX3y7OsxQufDXj/Erq2oOzr1pLmyhjq4nsgWIlSN29SCUNhyWjWACjd9WiXTQecr0NCvR75U32dQlVc95NO@vger.kernel.org
X-Gm-Message-State: AOJu0YwxhGn8coBKmj0Vc9QpXBXV+Dm98s8ZH6qkgboK0GLaCQCV67+a
	J2UaUiWOypp5hHcTa2l019VKIWW9wheb0cc7WJQ4aKj+XdEe+bb8DULr+dUUfFufRH1e8RblZON
	K4RbKLElHa34g9SzzhnBSaZd7heoyjd1G8cM+zAljIKtZbCUvnTE5D/gVKwOej3KDzlVq
X-Gm-Gg: AZuq6aKbLNdM6H0UBHTWyvphLxn7I4S9A0oo9rNoTVd54RorE6ysuxpD3WHKFIAkrbf
	EhuhwFjnm/EiKVIwPVNQxhXn/wpDurQJciFr0pRAPBosLHbPdsVVpjrVIdKI+jSx/b0zCnI5FCT
	lm6vCK8V7a8JctscjNgg6mzq1/+nflUeB7HRU/w44za18JF/H/KEkeXcZHBsvDb6slL0uIJbFeY
	WTEaxe4i8rlJ0IwXjQSGOhkK4vzjfQ5974JDUKbYUaMsce9FD3EBcXJma2vxWCmn5i87qTm/o/6
	kiNoUD+QdAcWijGTnFUN/rx9ISU2Ju0PWKFoSAwTs4Qj9zRupyCLchPcnRvieGTxFNkYsZFrjMa
	85hR2Zepi/Zv84Mfsji59JMFxWpMPBFD9Y9irytM=
X-Received: by 2002:a05:6a00:9287:b0:81d:dd3a:b8ff with SMTP id d2e1a72fcca58-823ab76e226mr5457602b3a.53.1769859967405;
        Sat, 31 Jan 2026 03:46:07 -0800 (PST)
X-Received: by 2002:a05:6a00:9287:b0:81d:dd3a:b8ff with SMTP id d2e1a72fcca58-823ab76e226mr5457580b3a.53.1769859966766;
        Sat, 31 Jan 2026 03:46:06 -0800 (PST)
Received: from [192.168.1.6] ([106.222.229.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b1efa6sm10306085b3a.6.2026.01.31.03.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 03:46:06 -0800 (PST)
Message-ID: <dfdb2f4f-9c94-4d44-8dd7-67e8f4e025a4@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 17:15:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] remoteproc: qcom: probe all child devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, mathieu.poirier@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, konradybcio@kernel.org, amitk@kernel.org,
        mani@kernel.org, casey.connolly@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <evb5tn2cht7wk76fuc2wpsyxepknigfw37633n6ypuapstbceh@tn5glmi65bdv>
 <cb5430c8-12d6-4439-b1ae-c2f36f29a9f8@oss.qualcomm.com>
 <57493aef-fb35-4377-8cf3-1df7f53470c9@oss.qualcomm.com>
 <74h7r3vsig3csejax3eu3uk53mdiimg2hjx7ntmmfrwdai6s3j@eiztghclfcvt>
 <5db5dafd-3c1f-4844-b822-bbfe86b3eb4d@oss.qualcomm.com>
 <ctrpymbvjlchp3djnsqq4bghkq2zvqnf5bebszi74f3d36l5dv@icvnkdwgdxmi>
 <ef1911f5-2d96-428c-93f1-3d1815710894@oss.qualcomm.com>
 <98397a59-8ef2-4202-ae41-015c895d6bce@oss.qualcomm.com>
 <c5ace95c-6ba1-4ce9-b461-82225a9fc576@oss.qualcomm.com>
 <f461ca33-0892-4a58-a40b-6da2a32d1430@oss.qualcomm.com>
 <33kugspepphj3ywp642bp5ee4zd6pk6pxbooe4knv62coeofo6@5zqxy4n37k3j>
 <998079d0-1c38-4a93-a63d-6bf9c91c4a83@oss.qualcomm.com>
 <CAO9ioeVxbAJR-JSVSVOgtZaTmwqaez=2K5Rfxo=+swUJ=YmN3A@mail.gmail.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVxbAJR-JSVSVOgtZaTmwqaez=2K5Rfxo=+swUJ=YmN3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA5OCBTYWx0ZWRfXytqP0y6zDtpk
 kYU/OQWmhA5WX0HbxjJ+v7nroiP8pY3RQoqtnkkKD+nbeBhCbqCVaZVn/GFJblcuyfGA7kVmj4H
 +vDDgSGBLHlaUgezqV8dTwPSJGYomQ93eagaUWLwmtMvqEZrplWsW8i+LwspN6dSQThKlul7Nus
 +Kj/Emvg273upxWFeiAyxJ4mtqsFlqHbzpvKpzmjIyumg3C3y4SEMs2x+Aa60x7PebvZOQL1oM7
 aWJ9GYTMGb8kcvCJbKDfW4wrnwEk07surYgdU+jUDZD3Fjr1Q3nrvQh8LaXyC8SRUxsv46Sxsti
 AW9pgqZAhPpxgj6faCvo+IDGVfi0LBB7s/Kuh7MH0Rc6sDKTDNaLdJGFgH/FdYtexHjgBIaE+08
 DWEOgriTRxFF5jfPU9bYeQ/fXIsWxv2UWiuhTsYKcWtdTVF84DdtB0f2R5iEY349YHOm8+EVzRi
 kdj1Pooqv2UbO7W9CeQ==
X-Proofpoint-ORIG-GUID: 8QWQ_LSBlBO-7ETT80lLwdLre-gaUFuw
X-Proofpoint-GUID: 8QWQ_LSBlBO-7ETT80lLwdLre-gaUFuw
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=697deb80 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=EBd7WcfsMYPMwvoCMWz0vA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=D6nknfrBpnRlDUAZrOIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_01,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310098
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91368-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 82112C1BB6
X-Rspamd-Action: no action



On 1/31/2026 5:10 PM, Dmitry Baryshkov wrote:
> On Sat, 31 Jan 2026 at 11:12, Gaurav Kohli
> <gaurav.kohli@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/31/2026 1:36 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 30, 2026 at 10:13:06AM +0100, Konrad Dybcio wrote:
>>>> On 1/30/26 8:03 AM, Gaurav Kohli wrote:
>>>>>
>>>>> On 1/28/2026 3:15 PM, Konrad Dybcio wrote:
>>>>>> On 1/28/26 10:39 AM, Gaurav Kohli wrote:
>>>>>>> On 1/27/2026 10:11 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, Jan 27, 2026 at 09:42:10PM +0530, Gaurav Kohli wrote:
>>>>>>>>> On 1/24/2026 12:33 AM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Fri, Jan 23, 2026 at 07:23:39PM +0530, Gaurav Kohli wrote:
>>>>>>>>>>> On 1/8/2026 12:37 PM, Gaurav Kohli wrote:
>>>>>>>>>>>> On 1/3/2026 8:26 PM, Bjorn Andersson wrote:
>>>>>>>>>>>>> On Tue, Dec 23, 2025 at 06:02:21PM +0530, Gaurav Kohli wrote:
>>>>>>>>>>>>>> From: Casey Connolly <casey.connolly@linaro.org>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Generalise the qcom,bam-dmux child node support by probing all
>>>>>>>>>>>>>> remoteproc children with of_platform_populate(). This will be used to
>>>>>>>>>>>>>> enable support for devices which are best represented as
>>>>>>>>>>>>>> subnodes of the
>>>>>>>>>>>>>> remoteproc, such as those representing QMI clients.
>>>>>>>>>>>>> Please flip this around, start with the description of the problem
>>>>>>>>>>>>> you're trying to solve.
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>>>>>>>>>>>>> This must have your signed-off-by, where you certifies the origin of
>>>>>>>>>>>>> this patch.
>>>>>>>>>>>>>
>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>        drivers/remoteproc/qcom_q6v5.c     | 4 ++++
>>>>>>>>>>>>>>        drivers/remoteproc/qcom_q6v5_mss.c | 8 --------
>>>>>>>>>>>>>>        2 files changed, 4 insertions(+), 8 deletions(-)
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> diff --git a/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>>>>>>> b/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>>>>>>> index 58d5b85e58cd..a02839c7ed8c 100644
>>>>>>>>>>>>>> --- a/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>>>>>>> +++ b/drivers/remoteproc/qcom_q6v5.c
>>>>>>>>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>>>>>>>>         * Copyright (C) 2014 Sony Mobile Communications AB
>>>>>>>>>>>>>>         * Copyright (c) 2012-2013, The Linux Foundation. All rights
>>>>>>>>>>>>>> reserved.
>>>>>>>>>>>>>>         */
>>>>>>>>>>>>>> +#include <linux/of_platform.h>
>>>>>>>>>>>>>>        #include <linux/kernel.h>
>>>>>>>>>>>>>>        #include <linux/platform_device.h>
>>>>>>>>>>>>>>        #include <linux/interconnect.h>
>>>>>>>>>>>>>> @@ -351,6 +352,8 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5,
>>>>>>>>>>>>>> struct platform_device *pdev,
>>>>>>>>>>>>>>                return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
>>>>>>>>>>>>>>                             "failed to acquire interconnect path\n");
>>>>>>>>>>>>>>        +    of_platform_populate(q6v5->dev->of_node, NULL, NULL, q6v5->dev);
>>>>>>>>>>>>> There are other child nodes here, in particular the GLINK and SMD edges.
>>>>>>>>>>>>> Do we really want platform_devices registered for them?
>>>>>>>>>>>>>
>>>>>>>>>>>>> Regards,
>>>>>>>>>>>>> Bjorn
>>>>>>>>>>>> thanks for pointing this, can you please suggest the right approach.
>>>>>>>>>>>>
>>>>>>>>>>>> This should not impact glink, as that is registering as rproc sub node,
>>>>>>>>>>>> And we need rproc cooling as child node
>>>>>>>>>>>>
>>>>>>>>>>>> of remote proc subsytem to create probe dependency only.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Can we do platform populate for specific child, would that be right
>>>>>>>>>>>> approach. or we should create rproc cooling as independent of parent ?
>>>>>>>>>>>>
>>>>>>>>>>> HI Bjorn,
>>>>>>>>>>>
>>>>>>>>>>> I’d like to highlight the impact and details of placement of remoteproc
>>>>>>>>>>> cooling dt node:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> ->As a child of the remote proc subsystem node:
>>>>>>>>>>>          In this configuration, the cooling device will only be probed once the
>>>>>>>>>>> corresponding remote proc subsystem itself is probed.
>>>>>>>>>>>
>>>>>>>>>>> ->Outside the remote proc subsystem, may be part of soc node:
>>>>>>>>>>>          In this setup, the cooling device will be probed independently. It will
>>>>>>>>>>> wait until the remoteproc subsystem is brought up
>>>>>>>>>>>          before completing cooling registration.
>>>>>>>>>>>          The drawback here is that if the parent remoteproc subsystem is
>>>>>>>>>>> disabled, the cooling device will still undergo an
>>>>>>>>>>>          unnecessary probe, even though it cannot be registered.
>>>>>>>>>> Bjorns question was different. It wasn't about pushing cooling device
>>>>>>>>>> outside of the remoteproc node. It is about not registering the devices.
>>>>>>>>>>
>>>>>>>>>> Can we follow the approach outlined by qcom_add_smd_subdev() /
>>>>>>>>>> qcom_add_glink_subdev()?
>>>>>>>>> Hi Dmitry,
>>>>>>>>>
>>>>>>>>> Thanks for the review. Since the remoteproc cooling is a QMI-based driver,
>>>>>>>>> it will receive the
>>>>>>>>> subsystem up notification directly. Therefore, there’s no need to make it a
>>>>>>>>> subdev node or
>>>>>>>>> tie it into the init/reset sequence of remoteproc subsytem.
>>>>>>>> But you've added a subnode for it (and we are discussing exactly
>>>>>>>> of_platform_populate()) call. So, you are tying it to the remoteproc
>>>>>>>> device lifecycle instead of the remoteproc subsys, which seems strange
>>>>>>>> to me. There is no cooling device if the DSP is not running.
>>>>>>>
>>>>>>> For the cooling feature, we don’t need to define it as a subnode. The cooling subsystem becomes relevant only
>>>>>>> after the remote subsystem is up, at which point it will receive add/delete notifications from the QMI server.
>>>>>>>
>>>>>>>
>>>>>>> If child nodes must be modeled as subnodes for rproc, we can move the CDSP TMD out of the remoteproc and add in soc.
>>>>>>> Is there currently a way for the remoteproc core layer to call of_platform_populate() without requiring a subnode?
>>>>>> I think the question is "why can't you register the remoteproc device
>>>>>> as a cooling_device, with perhaps #cooling-cells = <1>; instead of
>>>>>> any form of children?"
>>>>>>
>>>>>> Konrad
>>>>>
>>>>>
>>>>> thanks Konrad, for the review.
>>>>>
>>>>> As each subsystem can expose multiple thermal mitigation devices via the remoteproc TMD service, so need to define child node.
>>>>
>>>> I think you're stuck in an XY problem - you keep insisting that adding
>>>> a subnode is your end goal, while you really want to achieve being able
>>>> to register multiple cooling devices. Or at least that's how I read your
>>>> messages since you happen not to give any explanation as to why it's
>>>> actually necessary.
>>>>
>>>> In my previous message, I forgot that cells for cooling devices actually
>>>> represent the minimum and maximum cooling state allowed. But since the
>>>> API is just part of the kernel, there's nothing preventing us from
>>>> evolving it.
>>>>
>>>> Currently, we have:
>>>>
>>>> Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
>>>>
>>>> properties:
>>>>     "#cooling-cells":
>>>>       description:
>>>>         Must be 2, in order to specify minimum and maximum cooling state used in
>>>>         the cooling-maps reference. The first cell is the minimum cooling state
>>>>         and the second cell is the maximum cooling state requested.
>>>>       const: 2
>>>>
>>>> But I think it would be perfectly fine to suggest a change such that
>>>> if cells > 2, the last two cells keep the current behavior and the former
>>>> ones let you index into a cooling device exposed through a single OF node
>>>
>>> This might be a big change, which probably needs to be coordinated with
>>> thermal and DT maintainers first.
>>>
>>>>
>>>> e.g.
>>>>
>>>> rproc_xyz: remoteproc {
>>>>       compatible = "qcom,rproc-xyz";
>>>>
>>>>       ...
>>>>
>>>>       #cooling-device-cells = <3>;
>>>> };
>>>
>>> Which brings in another topic. In DT we have labels for different DT
>>> children, which correspond to different handlers on the DSP side. For
>>> the CDSP we see a "cdsp_sw" only. I think I've asked several times, but
>>> didn't get an example of the device having more than one, just claims
>>> that there might be more thane one TMD.
>>>
>>> Do we need different cooling cells here? Or would it be enough to send
>>> the same max state to all TMDs on the DSP side?
>>>
>>
>> For newer targets, Within the CDSP we have compute core(cdsp-sw),
>> npu(hmx-sw) core and both have independent dcvs and also dedicated
>> tsens on each core.
> 
> Okay, inside the DT bindings please provide this system as an example
> rather than using the simplest one.
> 
>>
>> And For Modem also we have multiple mitigation devices based on
>> different modem tech, for e.g tech level side we have modem-lte,
>> modem-nr etc and mitigation at different power amplifier side like
>> modem-pa etc. We have not added modem node for current series target
>> as it does not support modem.
> 
> I wrote it several times: there is no reason to limit yourself to
> CDSP. Please also add support for ADSP, SLPI and modem.
> 

Sure, will add.

>>
>>>>
>>>> ...
>>>>
>>>> thermal-zones {
>>>>       super-rproc-therm-a {
>>>>               thermal-sensors = <&rproc_xyz RPROC_XYZ_COOLING_A
>>>>                                  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>>>
>>>>               trips { ... } ;
>>>>       };
>>>>
>>>>       super-rproc-therm-b {
>>>>               thermal-sensors = <&rproc_xyz RPROC_XYZ_COOLING_B
>>>>                                  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>>>>
>>>>               trips { ... } ;
>>>>       };
>>>> };
>>>>
>>>> This would be resolved by allowing drivers to register an .of_xlate-type
>>>> function which would take the RPROC_XYZ_COOLING_n argument and e.g. use
>>>> it as an index into struct thermal_cooling_device cdev[]; within the
>>>> driver struct.
>>>
>>>
>>>
>>>>
>>>> Konrad
>>>
>>
> 
> 


