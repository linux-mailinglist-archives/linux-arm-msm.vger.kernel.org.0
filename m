Return-Path: <linux-arm-msm+bounces-90734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIxmFJikeGmGrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:42:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C229E93C1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03D4B303CD31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28476348862;
	Tue, 27 Jan 2026 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAHBy+sG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GDD5oV66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D5346AFF
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514025; cv=none; b=jXQQNML/A6tcB8hsGV/YykP1k6dbEf/Qogx+a+LaardhsPiGDTpoMCuio0YNiQAkv47DPFyZT9SMpe1b6hcJ9GJMszOkAuuOWnzQWnTkf0Pm/psoNYMH2OW1nc4HLi62dLcXAfpAgYSMYYLjU2IOR2gMBSGOfuuYvmw45aIwuiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514025; c=relaxed/simple;
	bh=Z34XndASaBYSPIlyXDDXMGIrowF0LIEMraPJAbcOFN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qruXdigV0MzLjF2oPy5qelBHKWcu26uNeeYu1ClMirMwP6sXjBMsclh796PjnQu8sCeiPe6YJfadm3JUmNeAKGnW7YsUur9c9EoN7K/hzaFjev+vQbD55QA9hQph0WWMzrykQ2KV5KkvttuZuxfKW4bNXrImQMNKgunVfcbx0FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAHBy+sG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GDD5oV66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA7pZH1268748
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pyTXE/4ktfP1wNLAIJ7/zW9REPL6MyuWS6OZkwLnWWY=; b=hAHBy+sG536gNtP6
	pXAUBOxpm+99bB1rqlGmzL0Bi9E4T0En53RYgJ6/K7Ipq2UKgzBZt1YY1vkVAyEO
	KOEif28qlK55eehNSqsGLjuDXpsEFaLrtXUHQWOjxkVFePdwdB89074hPJelBEPp
	dQGB0EV67CqhHTS9/AkiQLrEfpAbC1ZQDJcbPVJ+YTUkIgAdsQ2TzzfG1Q+Enor2
	T4q328U2+M9pPwkwIiseDODEmcJl8DOVe6bI9KQfUmo+UWdPe7TmNjrQB+fOr1Ph
	9/0hDMnznNST1oQ/NP9se5wp2+YvBh9eIPeAxinElBl64EVY3NfRD4EPCmJi9RrY
	vVZnIA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasgsy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:40:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70c91c8b0so12445885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514022; x=1770118822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pyTXE/4ktfP1wNLAIJ7/zW9REPL6MyuWS6OZkwLnWWY=;
        b=GDD5oV66+O/Bub9GGusy7cEfXGoZdJ3OG++34u1Ow2LEer5FBPXPlyTQI+u4ReEfBo
         +3yWFRAHVbd7H2HyTKQtn+1e8kNwm0zJrzFdYsOrmCAzeaiPjSsAwJw8SObfz6qxyKB/
         04U2cY22mXbyDM2xJ0GS2q08orHWuWu1hD6Owwr+CKyA3zSnlt9o6MX/oFZebzWO5TLs
         /CBQ1mM5I9NKJWRgR9fE8XdGabUoOGxSMkILfA9c07bXs/SWoyXXy/vVerWYA8EIk5Vk
         MQiCSDWTtZddbtGZYkxxcjAvxx7TRW1z/UIrwZ2rnQxDZhbEXJUdBeJuxJr7jRCj89lC
         Jpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514022; x=1770118822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyTXE/4ktfP1wNLAIJ7/zW9REPL6MyuWS6OZkwLnWWY=;
        b=HgD6BC72zmiPUacxpstk/tpZxT3WdSrvKrsG/7BReKp0TkC9VWDt/A2z9qkGMivnJq
         WF+ylccqqLAByjEuVWDiHnvLY/K41zPkxSM0IOFCVPyAHM5AmgxH0drRQQP8blotCgVj
         8Fz46mYwnaw9JsyETKD3MR4DMSygyV2eoKGTKwEWwczIOoZVK9F96DWpT7pRbRjNts0l
         +638w1G9QUzEdAvxKxW7m++QRVt4wLl9BYlDo7nbNhVhT5CZrM2hB2kqJvtMU5Q5fvsN
         WZEmajiOEiGATFWMw8aBWFhArS7zJoDv6unsRX/YVLAlqdhNK/y+dH+FNAZ5RiaGJ9Al
         YvJg==
X-Forwarded-Encrypted: i=1; AJvYcCXOz2sTNULo1uJJVpl+4IdzmwJ9eDDou+V2ivKax/FRsZIceamM19n+SmONQoHF+rBfvG/vTZa02VbmyBQu@vger.kernel.org
X-Gm-Message-State: AOJu0YwTliRnyVYw1MGT/75gZZsaCVuRlg5BM4SuDpdIbBaJgni+2gjH
	BF+8AjMeHug7FkfKkMutAyZ4P1yJ5Up05n3rkkoGxWMyjJQDRmJM4Yd2lCd8h7VPs4qGyyrm2/M
	mdqc37YcBnHu2w5TCUhjnUbA7mZ6o3XpW2U4WLbtH1PZOAupMr2OJlxcQIKRvG7PAYMdd
X-Gm-Gg: AZuq6aIuqcBokKfwy5YLOelnHZ71o9RAGTqvtDonSl87RvF+oaXeJ9NoTJiP76dEKqp
	S5oieBl8fn6IEWYYu5AzU20P5gEOLe8mMTwAcJR8eTsMRYamQyrKe3bjBWDchIJoKohSM70LhY6
	n7NPGxpxnUuB5AX8uAvw6NUJlhHVWont2BMd7MvFdDWrcBkUN1h/1VB+QjwfiXtXPB737Ibe8Nt
	nzAbE44/7cI2d+0c0gAXHn9L4GYFb+lSkggTk1gsqeNZLalTMfPJ6+jALF1PM8/T/5Bs8rDDmkI
	wRFyYpckkJ22uRVaNyv/CNT/f2+V0F3sFvuR1kU4Tb8tG31zLknLxPERGunwNprpI20lXQxnH1G
	65bI4lb1lzuK9ia1bOKCjbbPzZ5SccFOuONKJbtE1+BE0wZyRU04D49EoVaEUo8hc7SU=
X-Received: by 2002:a05:620a:28c6:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c70b9821b8mr101513285a.7.1769514021922;
        Tue, 27 Jan 2026 03:40:21 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:8be:7dd7:f041 with SMTP id af79cd13be357-8c70b9821b8mr101511385a.7.1769514021556;
        Tue, 27 Jan 2026 03:40:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658666bbcc2sm4473866a12.9.2026.01.27.03.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 03:40:21 -0800 (PST)
Message-ID: <721580cd-b493-479f-bd1c-6fd96df1d46d@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 12:40:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: dt-bindings: qcom,sc7280-venus: drop
 non-PAS support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
 <20260126-venus-iris-flip-switch-v2-2-b0ea05e1739a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-2-b0ea05e1739a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1caR9D9-Aon4grryCMHk8IVgOAOSodh_
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978a426 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oktRuHzOpdk0QsFJu6YA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1caR9D9-Aon4grryCMHk8IVgOAOSodh_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NSBTYWx0ZWRfX/IrlnhVDnwT6
 JmV9koDcajoP3i8UgfS6Wf7WlSSpMGsc30k7pZ4rmzq43SyXxeJXyGfYx/4sOl5dJK5OH9Oj9gk
 lbymejzMvBixZf5ASPu4dC11sCKFvXTy7XO5OwWUgFIpSPqtC/E1L3abyU0oBBt/OKfebYRjEuX
 bMipJtiLSyogJg4pRKF5Qr7SZO8w6cdgANXKIuumFVfnH24vqeZ8ANFFZg+uAaY7tg4fNdsU3Lm
 21zqS1l2feLfT7nNaG7EQ/Gv9B1zZKuHNQt5PkoAo1t0ODo9d9wiP11skMZOysQ/Pqi6i7Yfz1s
 +k6BRKbE2r5qmWaS3ophtpeU95nKzLnZTOJ3i/MAhL9A3TzGl47DxOeSWBnls9m1pEwmWnYksWB
 GAEJY1ZZOH9tPmpm1N1WiGV69w4iPwrpGLHwsItnTZNFc5qUZwiTxJ3k5AGXDrZCXNbrgpZKwgF
 SNZItrmR8dJw7SrnUoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270095
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
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90734-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C229E93C1C
X-Rspamd-Action: no action

On 1/26/26 3:09 AM, Dmitry Baryshkov wrote:
> The only users of the non-PAS setup on SC7280 platform are the ChromeOS
> devices, which were cancelled before reaching end users. Iris, the
> alternative driver for the same hardware, does not support non-PAS
> setup. It is expected that in future both Venus and Iris devices will
> use different ABI for non-PAS (EL2) setup.
> 
> In order to declare only the future-proof hardware description drop
> support for non-PAS setup from the SC7280 Venus schema (breaking almost
> non-existing SC7280 ChromeOS devices).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

The commit message could highlight the *actual* problem ("iommus"
entries aren't treated like separate entities which is exactly what
we need to avoid for this complex hw)

Konrad

