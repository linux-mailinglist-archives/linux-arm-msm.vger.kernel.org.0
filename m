Return-Path: <linux-arm-msm+bounces-92476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCRDDWEGi2kdPQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:20:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3A119918
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF7C53039F42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B0D352FA8;
	Tue, 10 Feb 2026 10:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMKopnLB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ay7zqdKP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8715352F99
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770718792; cv=none; b=Fj0SIheLveOK5r7F0Hn4QbSzN+QaqBT6/9TwM4VZNXOCcm33607Kc0sbd9UOtRH/NsbrA3a+VlkPeL93Xw8EG+/zliWnBoOVMdK5DZJ+2TEdzJcaoEtT6vyVYHN0RUuXeHN7v7u+fs+kHFdb4ykXKls2Ih17MZggeci7Xau87IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770718792; c=relaxed/simple;
	bh=W8eKgxz75TaxalIUxwgfNx8txGwvrbC3VG3ZM/y6H1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iF/bdz4jVB4MMMrLM9w6sJykCluFkFTTcEKUf5We25e+bz/z6XZT5I/q7hPswBBDdhAADlBO4e03mrjKaa9O42mmkU7oZ6W84/QZulYEXL7ctVdQc/6UYr5FZnDRy+YOF1ZJejV+rz9p1ULLOxyoBsf8sbusYkjPa0Bmm+qRKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMKopnLB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ay7zqdKP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7bkek4003532
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	escwbqVJN0/V5CRcV9ZKOJ/PB8ZuKP8rhVmgblAx+Yg=; b=KMKopnLB74y78K1G
	UEmtKFOqHJLIGCRvIXmweHtsQjGDlBTU3uFuaT50WDzfCLVHRnj0eOEDjp0l6VZ3
	k4VuZK3QUigl3gvtWH6IIWirF5TrA/9mM3rns9dJt0SoxsHM4CEE6eUfpYLvJ2lH
	Bb/wwma4TNVAgs8UIi9rxMg05qBFvVwuoTlP+ofV0z/CQJsmsQRYCC1aM5bPnZmM
	5BC4IGe3mlE1G5ejxuyBXGnGJkL24YzqOCR+jh4TNz7cEPoMYdr9dMvyfpyjkUnG
	II91t+LfcaypWKquU89ppM2GvyJszNV+xIEw+x0g7CD2uxkmTsWQb/7yDhDqDXoL
	UGxhGw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7r23j5mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 10:19:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c54e81eeab9so3811763a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770718789; x=1771323589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=escwbqVJN0/V5CRcV9ZKOJ/PB8ZuKP8rhVmgblAx+Yg=;
        b=Ay7zqdKPhN8PXw8mZerikwt7Nd+qpJOkPtZNH6Xo4eyIyiUbQjIhtS0s1P0oaaLYvF
         Gz6fZpfFTxl1Yh1x/4Si9Z/e1PTb76vTpcZd+DHn2xSLpEBVeQgkwWDiUcat0b2k61pA
         JqMxGiV/PL2YDgy8a0kveGPNwzDu4Sss3/6t48i8IXlfu/6Zdgw9j60E3qdLkouUP+f1
         pobR45RuZYItfcq8SRe6XwBowqfOBEcXvbxxE8zjheYDOJQxWHlYJseyCCqSxAbnYvFy
         zOmw0VI3EavxD1FEW/7r5qNGOSskdIgAVIdW2eA1lnyhVXPJQ+f9pj8MBvXyQXNGgyhp
         NwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770718789; x=1771323589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=escwbqVJN0/V5CRcV9ZKOJ/PB8ZuKP8rhVmgblAx+Yg=;
        b=wV4q/mJA4G3PpcfvcMSvr/0E6T3U7FbRJhdhLklJ/751Avrg/7cZrzhUQpvorxH0mC
         bAGHoQrGxnZ413FSr7nx3OgJ5iXkUaDejXKHDOs+K8/72GoCJNHRy7xwxEAEntsYkE8N
         35ku+Tu5RuaLNRAd4gE8xhHXC8erE00Fm8IskqwldCt4lVvixCrr8wvlu+3Kh55fwoAE
         y+Rzpgse6hoOvIY0XOx/ZORpHRaqRMz2Z3AhepsKmJdyqQy4F6GyLY7WEj5SeIZp7rwP
         sadkbwi1ytwpDVJedXQe5+sqCJuA67kKQMl/ngWbXUIGxrWrL0WMCzDSWqz+omWNLUgO
         YmnQ==
X-Gm-Message-State: AOJu0YwqQFuP0fE5NFWDXAUVO/03a9jqKuj3+OhfgO6g033Qphp6KVFF
	yn3mO+0UZNT6P3tP98nyQ68QphMJyOJmw4qVOfuRFNT0CYJnFZDsuXtNkRgyUu9Unr7VDWXLRNt
	59xwWXr8oLydFukEY6F0CDKE2KVh4uKK/F9yXNzZJ3+Cci1jjsD3L/ZgvBNxldzPgbT6t
X-Gm-Gg: AZuq6aJ7UkHxRoiYIZQvvecJBf2AsVSdlzDcNWQzzpPqWpcP7oFWqW3zVK0FF1witYw
	3zKeYooXUEX2MZ6eYbVQFiZgOC3yb7qGq95VEDbFcBSji2nR8ezdOseFVmXFUC7BEMNrcYKlHXF
	t63YpHvtyfeVKqptR77BHIieV7lVTGNT60ksSnxF53XQ8S/plSDECcGI7fIqI0Z7/tPiZ8RaTlY
	jgO5PRToDr0BkLD6ESqpeSN/dhWsnsOXfCB2vJ6b3/JP8+le+AV8tfiwX2j8SfdLjYNjym8lZYM
	wQstM8qvI++MGgdBhdU2Ql+oPUqzHDxuwzsmVN6Dh/EAAUtLJMHvFytgotvj+SodnZ2ZvfD9o+t
	0IkUxpNF7Rg3oz02byRh7bhvo+RYk05pVQaNBDaDxtVw4Nvr+XYpm3Ep7JMoavPFV+eImh7Gufb
	i2LlIPV8cHd7gSGQY=
X-Received: by 2002:a17:90b:3505:b0:341:c964:126c with SMTP id 98e67ed59e1d1-354b3d086f9mr10609074a91.34.1770718789474;
        Tue, 10 Feb 2026 02:19:49 -0800 (PST)
X-Received: by 2002:a17:90b:3505:b0:341:c964:126c with SMTP id 98e67ed59e1d1-354b3d086f9mr10609053a91.34.1770718788995;
        Tue, 10 Feb 2026 02:19:48 -0800 (PST)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441695f50sm12314405b3a.22.2026.02.10.02.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:19:48 -0800 (PST)
Message-ID: <08cec7fc-a3da-4879-857a-32dd65c34311@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 18:19:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qcom: edp: Add per-version LDO configuration
 callback
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-2-231882bbf3f1@oss.qualcomm.com>
 <200b055b-7221-45b5-aea1-2462e07a3c1c@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <200b055b-7221-45b5-aea1-2462e07a3c1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4NSBTYWx0ZWRfX7Gg9xTeO7qq/
 NDZY803+tZaEUqmdnX2k72d+znBNgXQSJu866a8XcpuhLFUtyKD4TlThqJPDpdSp23aTKGkoSmJ
 Ht5GQZCjQR/DwDoBgE2qZo0E/xGY2siD3myyhWyMMYucbnpQpZ67Xys5IAsYUjuwXNR2UY2lwy0
 lVO0/0kL6NmQfw9IHCns6g0Szeb9wF28rln4IFZJJl2Kpx+GLsj5h8FQrNV+MMyc/5jzTnj/TIX
 6r5OzaHpfr/SBMQ/NpgKYRgmlZDXvVC6ioza6QlC2OFRs/YSeb5W5b3EcLL35sFc4RdcP6AuD9I
 8uwvklM++QS6eUPXbQUR1CjP5WXa8GE8gH2spxSMgPSy2reUO95KMlcVK1ooEiUyAv6G9veDhdD
 W76VnwJGgKKizb+mKmx/vEv66qrU/gAzr5Tybf+7syAr85Bj6SMmydlwO4lZMDVBU+pjpwVUL2Z
 YgZw9KIF0KgaYNh+FXQ==
X-Authority-Analysis: v=2.4 cv=MLRtWcZl c=1 sm=1 tr=0 ts=698b0646 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=3p2AMVgKIYlyzUkkMicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: iLElvXrga3k5qQU8V1R7h0e5jRXpocSI
X-Proofpoint-GUID: iLElvXrga3k5qQU8V1R7h0e5jRXpocSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92476-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6F3A119918
X-Rspamd-Action: no action



On 2/6/2026 6:52 PM, Konrad Dybcio wrote:
> On 2/5/26 10:20 AM, Yongxing Mou wrote:
>> Introduce the com_ldo_config callback to support per‑PHY LDO
>> configuration.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static int qcom_edp_ldo_config_v4(const struct qcom_edp *edp)
>> +{
>> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
>> +	u32 ldo_config;
>> +
>> +	if (!edp->is_edp)
>> +		ldo_config = 0x0;
>> +	else if (dp_opts->link_rate <= 2700)
>> +		ldo_config = 0xC1;
> 
> lowercase hex, please
> 
Got it. will fix next version
>> +	else
>> +		ldo_config = 0x81;
>> +
>> +	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
>> +	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
> 
> tx1 should be dp_ops->lanes ? 2 : ldo_config : 0x00, in all cases,
> I believe
> 
> Konrad
i check the HPG, yes , here need to consider dp_ops->lanes.. will fix it 
next patch.

