Return-Path: <linux-arm-msm+bounces-91453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNMaEmV0gGnU8QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:54:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9571DCA515
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1AE23019F1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 09:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D282DAFAA;
	Mon,  2 Feb 2026 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6O+ryPc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bquqx+Ez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B332652B6
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026019; cv=none; b=U5Dp/glnNtbKlH9Lo39Jmpcx2/FOJKv9uIBLiO6iYoQgnia3Mu8aa1Ftn8tk56efc2bfbq8kyqbeHE9eIUH2B+6fsayZIlaPcEGMfszhIk7HSy9jL9ULTzPseFuviyfh8IYzxoU6GxP5+/N0oXNe+J5qi38pd4e1psoQL9CaI1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026019; c=relaxed/simple;
	bh=SfNn4S+1U6Mx728Fu5fmHhagWzpAOe3rlokRF7duqr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2o9mKxHi+xH9qUs4KSAuzlAi7SeDpNrg4WXD7Z8aT2X83AHw5mAkWRYbSkwW36sprBSd4vWmjcXgHrl0raC87oY7m9sR3V+nWlUofSGNXNyatK1kht8MRXBCV9vqEuhwWQ0VsJHChXd+grFDzZkVLTFDrU8TYDoim0dFMVKadk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S6O+ryPc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bquqx+Ez; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61281HLn2798933
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 09:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jr6u6qi5uXkZE9bqbzYiknJF27AP0in+O3Qpto1prqc=; b=S6O+ryPcHpLqzBz1
	9mBJ7CfK9B1v/A6nqHnbmseqtL01HhZVNTsXTDaWnebfNPu4eNPqg1yOEyANHd/L
	q74b0odFqI2Iicouceflwl2H844MgSYh/jUZu8aNjoVBRpDvTg+H3hwoEP/yFqvH
	VqbSz/FKQoDYEmR5QID5KzGWucfHMi4Nxd4rly4TAhlAVWvEwA7NTCCcar3pZ2JZ
	kgdLfdwoCcykEYE6ubBJobEv/Gnf3WBqjuX07yq1Wz9+/2oMjT+6ss8NX5ILcuVz
	Kqn6D2XEuayeuk3bZOO+CmUFuFoV+A5hH2c3ACdtNpoJKxjFHJ3FiwSfuxRUc8LP
	D629og==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdcx49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 09:53:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c522c44febso92357785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 01:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026016; x=1770630816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jr6u6qi5uXkZE9bqbzYiknJF27AP0in+O3Qpto1prqc=;
        b=bquqx+EzOYrJ/K2I77bd7lvqHsHBJ8aLEdOU0YXge0S43rW8z69A+azRgw63/dnh0M
         U57MmuphsWcXrnTJDcgvCsn5HAswbCU7Zmwm0cH1zUbyiiLXmgdEjec/CwjYzBG8if6+
         UQkgFbB5sylB3UcK7jSjkmJCNhh2DTaFUq6Ba3FkS1a6S6XBPPYOXOGx6KybnEbCs1/Q
         7JjiircFKIiYhj3H5oFRH98v1dySm3rD9JYsYGwHBe6lIBNvh5EjMHmnnXVOmwxnPK52
         4BBSqr/7Irk+5/ekukE12zgmUba6Nh2M9UsJDwvZG7bqjumXgNsW2ayQ+6GkDgXL9gg0
         Tmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026016; x=1770630816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jr6u6qi5uXkZE9bqbzYiknJF27AP0in+O3Qpto1prqc=;
        b=ej+2/j3pBxI1BZ85g2RV/SE2qsx+mdpkmFWqX2kW7uKpXWdXXxmBGsSvr57wG2dvvv
         qJi/LQpSTWCEDQQwgCcF4zu+HlNire27L52Yi31oCt9bXwkBkuJ3jswC8lJjAWDEUsz0
         OD8r/YLMLIxkd1dFmDtOWnpR82ZfszRcslU2GMV8FMruSQtuFj/d4zwv16qMVXzAbVku
         mGgbqiwvyfcTtF6kBxNwMrByBuNwpKzPMS1gru9kYAj0a/VggMzifryD6FfWHQ0Xld+4
         t3c5leRNLuVy6kaHoR84cRx4vrBCl1N3ExEwIryQlBJ0m5ehGImq08OZXIlBaBxx/ERK
         rmTg==
X-Gm-Message-State: AOJu0Yw0M+/q/VNRVnAa5/jseq/1idHBZKFEVzioRnBeIYu3fGZszo4W
	7yULLpP1LErEMCxYoarSO2KFmpS7LjprsQ7M/kNZshKag7OQbbh+6aKwkuyAPBtFbz3+sjcOHRE
	axz3y851KmfsMPQs6w2QMsPplOfXgWvLt/s3GHPpbvri4LLQMhZR0vz1KVs5ZPHmHnTRA
X-Gm-Gg: AZuq6aKKoG83HEf5KWGIeghsztjaDfPU0MBJ5/ojkxKt03iaByin4f6XypJSanKxatt
	1ZBd5T4H89op+/7Pj7OAnyASnEN0wPR1fhmA942qAtJpcAUjbr8eKwRFy3QWL7bDbHtG8mUNzxA
	HFXXVaHEvdvnSGuk2ZVt9CD6MdiohVeHPouLhBZ33OBVX2hKSvlKDatUKMVuqINA+WXapn5Kuwr
	UvpewpyX2+/iqkkaKYmWrzdTv7LFLeQ+rpC2FfRjA45nev3R/7yhVsmqDIEHTqxKgcvGDLbtOna
	8cfGzL1MsaPTcCszhheMxsI2d8pdqRdCxnGBTRPn03phC46CmStY8mXRTzJ2qkZzupTAyj2vTKj
	40YQNDSJnO+S/RXDB2ntzKE4UJX5bMgZsTCpoAtqy+EZkJsasolJ+uHpCOuQ6nF+YF70=
X-Received: by 2002:a05:620a:25d2:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8c9eb29d9b8mr1161842885a.5.1770026015873;
        Mon, 02 Feb 2026 01:53:35 -0800 (PST)
X-Received: by 2002:a05:620a:25d2:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8c9eb29d9b8mr1161840885a.5.1770026015450;
        Mon, 02 Feb 2026 01:53:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ddcf8aa7csm723665066b.9.2026.02.02.01.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 01:53:34 -0800 (PST)
Message-ID: <f36e3878-70d9-48e7-9e98-796cbccb47e0@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 10:53:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] Add RemoteProc cooling support
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, konradybcio@kernel.org,
        amitk@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <2a39719e-e73b-4558-95fa-d54f94c43220@linaro.org>
 <6ae95761-6428-4a01-8c60-54df5e54b71f@oss.qualcomm.com>
 <cca414ad-0a98-467a-af31-72d40c43e27a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cca414ad-0a98-467a-af31-72d40c43e27a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qQ_5IOVz6p3RVm6q-N70Ozvpl10ZQxO6
X-Proofpoint-ORIG-GUID: qQ_5IOVz6p3RVm6q-N70Ozvpl10ZQxO6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NCBTYWx0ZWRfXz38Mt/abgc7e
 n8UCivXPZcyX0pwfW5NJxEM0vsN2gJDwihvX/l4Q36NkBMWi6BvjSvXxY2zg3IPbXF8hG/kzoc0
 O1+hI8vpSVPUiPr1PxjwbPdWMzop8cN6FAf+GFlzceCqV+Wu6yWMCRGNCz0JPuKLgBx0wLLn+YB
 sRLkuWeug8aR7ic325yV7z5QP30Ngsd1pwplWuRik/6HtKi1AEDlizIPNOLv/YVqPr+iHzgkkC3
 RVL9FO8CLecOE6s7GLwKlxlg1hGB0j38AjxAqKtz4n2Z0zGvw92FwCFaDN8FF0MuVsVJOpboSHL
 uBWralPuh98qTFyKX85lE1ra+WAwoEuYRWEaRAMWKjalVMoZ+aoQg7kV3owsJ9VG716pn5/2TTK
 G9+VSb/hFRU5/Lzv7Lr+/wMDuaxhpsRRRSo4vhm8NjiC33nBg8fy8UBwHyx1dAfZoUad/2JXkh3
 i484sUkNBK3PnZOMNnA==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=69807420 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=8BWbUoxn-aILMCT19TQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020084
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91453-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9571DCA515
X-Rspamd-Action: no action

On 2/1/26 9:20 PM, Trilok Soni wrote:
> On 1/13/2026 1:33 AM, Gaurav Kohli wrote:
>>
>> On 1/10/2026 9:43 PM, Casey Connolly wrote:
>>>
>>>
>>> On 12/23/25 13:32, Gaurav Kohli wrote:
>>>> This series introduces a generic remote proc cooling framework to control
>>>> thermal sensors located on remote subsystem like modem, dsp etc.
>>>> Communications with these subsystems occurs through various channels, for example,
>>>> QMI interface for Qualcomm.
>>>>   The Framework provides an abstraction layer between thermal subsytem and vendor
>>>> specific remote subsystem. Vendor drivers are expected to implement callback
>>>> and registration mechanisms with cooling framework to control cooling
>>>> devices.
>>>>
>>>> This patchset also revives earlier discussions of QMI based TMD cooling
>>>> devices discussion posted on below series by Casey:
>>>> https://lore.kernel.org/linux-devicetree/20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org/
>>>>
>>>> That series introduced Qualcomm QMI-based TMD cooling devices which used
>>>> to mitigate thermal conditions across multiple remote subsystems. These
>>>> devices operate based on junction temperature sensors (TSENS) associated
>>>> with thermal zones for each subsystem and registering with remoteproc
>>>> cooling framework for cooling registration.
>>>>
>>>> This patch series has a compilation/runtime dependency on another series [1].
>>>>
>>>> [1] https://lore.kernel.org/linux-devicetree/20250822042316.1762153-1-quic_gkohli@quicinc.com/
>>>>
>>>> Casey Connolly (2):
>>>>    remoteproc: qcom: probe all child devices
>>>>    thermal: qcom: add qmi-cooling driver
>>>
>>> I'm glad this series is getting revived. It would be good if you could explain what changes you made to my patches somewhere.
>>>
>>> I also remember one of my patches adding the DT parts for SDM845, would you be willing to pick that up for the next revision? I'd be happy to provide my Tested-by.
>>>
>>> Kind regards,
>>>
>> Hi Casey,
>>
>> With this remoeproc cooling abstraction layer, we have integrated your patches for subsystem cooling. As lot of comments came for qmi-cooling driver, so need to send v2 with cleanup.
> 
> Gaurav - the question somewhere in the series was that why you had marked your patch series 
> to v1, when you had revived the original (v1?) series from Casey? Should we consider
> current patch series as v2 then? I don't know if that comment was concluded. 

Because we have effectively 2 'v1's, there's already a certain mess, but
the msgid is different between them so the tools won't be confused
(i.e. just go with v2 for the next revision)

The outstanding request is to include a high-level changelog of what is
different as compared to the original series (as well as picking up the
original 845 DT commit if still relevant)

Konrad

