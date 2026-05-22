Return-Path: <linux-arm-msm+bounces-109194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD4BBysLEGpqSwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:52:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78C5B03A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C27C3014824
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 07:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680A939061D;
	Fri, 22 May 2026 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oc0WJNdn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FR06llqr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0130B28469B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779436328; cv=none; b=aS4k6+JTL3F3LJydaWLDOYWeOGqN2tPOwuLQmeMnLGirPBGjRn7Zg59D65GbvYU60rT5zLGiLfayOq7sWeoIo8QJ/leEg6AzPo/HcB2n79/DwuMv10SK3iCjPaTZ4HGFuok2CtZcGGuwjFti+ejPXoU6JgXxd6XvTAML987uNN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779436328; c=relaxed/simple;
	bh=73HsO8GAYBwT2euWWja6hKBf8Pz9+VA2Sgqu0PMrWJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcjjeTvlxrGUYiAk7L0oKFa8bOCsixKjb7SIreM5BcyYzE9Uyej+iFn4ziQY4ZCf4hthzk6h7SFVtTGcZsx+Mgqdk0boPc6RDxLR52IcmYmfAjlKD2fhe4pUodebyd/lj8q1vgKU/Dpvo8Le32vcoIitJYGX8yaOpd6TH/2HUcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oc0WJNdn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FR06llqr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6VGkJ1298128
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/+kkrFn/2fpFebovjxuNtM7tsPmleNa8yjdb4r0+/EY=; b=oc0WJNdnU8tNCcgY
	eclAJMR9Rcte+e0KYLcpxlyxqLODoz3Bk+Tv1MObz+gOW+FwLfQ8xsuWJLYJrwCJ
	uKsR0sayClC+iqHM8CA8ntWJFDqr3FHZ5fCntYXspM2NEcE8ACRbY3x6xYxbf73h
	yH6kBDSMlA2yvd02DSWGLTNnknclkniLnj4u7frKEHfcEI8FDW2H7UymFLIdvkCD
	YQ97OJHHvhK39ekNe8lBz4U6CV8kIEKMSKpt6CYm47jgL7zslMkn+ltLuFUgRzVM
	a4exMTITGQ0VtkSxq3i9/VMkn+xNzvo8U0j8hgWPMbQo7DRQFgzF78uUlUlUtnyH
	F/2Uxg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah09r30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 07:52:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9fe2d6793so162201905ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 00:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779436325; x=1780041125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+kkrFn/2fpFebovjxuNtM7tsPmleNa8yjdb4r0+/EY=;
        b=FR06llqrh8Wu/a079PnpMcpOXYfIMqyADZfMG2bn0KsLN513nk1T/AJmAdTiQVZuyJ
         HF1nmA1zKBgYMzuGNSq/QZBUb0TXsiVhYzd1G7BIDvtaX+mz4FRDh4MdpW6fPm/X44QD
         4m/SvMXsV2DFavWDDMaBcSoEKXW16DWqkPlt6hatb4NPCCIsw2xh29wAmb5QRgFivddd
         BzBq2doIz1PJ/fdx1yNwaybljsYK3YBTLbF6VnHoU6hDkPdKCt/ay9zL6WPukjZSOfeT
         Qff8dLbFuwL9hyz5YtpDW5UTw3IWrzzaIeFoWE1ZsvHIe9Zb40WFtn4VmPzVmQH9m8p6
         COWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779436325; x=1780041125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+kkrFn/2fpFebovjxuNtM7tsPmleNa8yjdb4r0+/EY=;
        b=l/Im7JBq6dnCkJjDA8JT0zzcgzT6cyONpTafBxFuaW0sri8xKzBVchZ343F/sOugYn
         FFLVZ9fPLA5VOKUN1xVBc51YUQxygmfgFj0azC21TGRugmJmc4EIVhEK/WKocKmOlGZL
         h53Bk88DXgnQd+fmiyVz6N4cKhCkzP0W7oAVIB112GWMKzhY9b5ykJhCaj1fCFCPl8nC
         wigD7fE+r9ksLWu8piUj7fo6fndSx5COnBujV8pLCDNf4OAvnMRsMvqX0DZtIyiRdFbb
         jsbsnZvK1u6EugsjTJctynoOJe0LaJtugZKu6zHOrgAynxsnjUCd8bhsa9sYBcvX4y/k
         J9MQ==
X-Forwarded-Encrypted: i=1; AFNElJ9n8d4o+wDI/6LlnhOl2vl4O5P1b9roA3jO/nZaIfIvRVD5rjsHc/HygKo6H0XkoMFkWe66ErUFwppN7esx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3H7XmMI+APsQgMT7P5OSyaYh3oqcN8jQd8ro6siuZKt1vxG4W
	q6Gz8CrghiQMkibijjeWvx+lXITZpc0yq2guoQfgRfQ7qkhN9uucvRTVt+fKIloBsr459K66QMt
	qSChGEiq059NiH7/VI28pB/htr66OB5R+eWJjyxWJoYgIyneOtQFPfASXaHFd1yDgkwqj
X-Gm-Gg: Acq92OGjccjV+0MfvulXPODIV5T2mJHhoKS7VKJR2OgMu30Qaa4WwzkhqQM72S8iy9a
	lmY2cY7NGsxtQ3pVXlZUaEK5viY+tziOE3BJr475yo2yqgl2BMkLP29A+vVdXNYofN0+FLCppvO
	lc2/U8LU9rW5Vqf8HFoeg+DiI8YhTjQY1M4T2OH0hoDuRdvWrpacCq2RcUdXBZ/mfOM7Mr+UsYM
	bgNqVlgp/uPrgzG+SEDmkKI/oQeifp4dGfEMWl5ooWw1b2/20W26FqDt01M42bcKIV7dtQhR3fe
	Tc1E7tmQZcq371V/ZmKPee1kAifW41DGyJmO0Zw/2swvRT6Jaso9FBuTWrLf7way5GMPwvFjHtL
	t57u/Naw+69S6+0z7AnyZ6K6zp2TJUzmefdKzKlyHgruKwfBwczhReCCQiVcFLAzww1F6dDJhje
	J9sBrhx7tJwq3qGKcRlg==
X-Received: by 2002:a17:903:1a07:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2beb0699574mr29375365ad.16.1779436325251;
        Fri, 22 May 2026 00:52:05 -0700 (PDT)
X-Received: by 2002:a17:903:1a07:b0:2b0:52b7:e82 with SMTP id d9443c01a7336-2beb0699574mr29374925ad.16.1779436324731;
        Fri, 22 May 2026 00:52:04 -0700 (PDT)
Received: from [10.133.33.148] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b303bsm9592715ad.38.2026.05.22.00.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:52:04 -0700 (PDT)
Message-ID: <083fc602-7549-4abe-a11e-51dae9fd0c8f@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:51:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/39] drm/msm/dp: Add support for programming p1/p2/p3
 register blocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-15-b20518dea8de@oss.qualcomm.com>
 <zputabw52nsba4ddwg7gd22tyouobkmlpq6blos7w3kx457otx@gitmjwroo7ou>
 <55081f4d-f1a9-42c7-a1cd-cdcefc008668@oss.qualcomm.com>
 <qslmbwi3xwdlc5fac4yjbxf5neckmiuy74en2wiccv3gos65ey@twcgc5wrayrh>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <qslmbwi3xwdlc5fac4yjbxf5neckmiuy74en2wiccv3gos65ey@twcgc5wrayrh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3NyBTYWx0ZWRfX2xmHbqIDbegv
 ALYVCf/0UY5hh9ddC/Zan0Bh+NSplZi05MSx6vGYU/YFqiqSMMeX0HPCd5JIcQ1lpHnQbyW1BQs
 34e9QctkvBAsUewTy3G6lFv07z4x4v8MRyN3oleIx9yLbCp0oX6SgcqNWqNXcscFPcgte/pjQcE
 7E1BROzNykU8WOW1iFxmmwlMHDO3Ao6CSHZIAIblCtR6KfAXPL9xGurnsHtMUM4Nvjs3E1j/ozI
 ySzsml2M8cClLYo6eo9GAOkiXKtMwt8FwcVLuFCjo5IX55oELz29hx/XbCXzMTTSu5H+M10xf1D
 1o7xWdEt7rRzubLu2cAzVD68pTCxTlGVWZ/qLbveeEmPx7IDmv/TmNB1DsKCAKktFLsk9X96luT
 /xc/zuodeZWOvrOjnswywjlnyD+u9gY2UZwZu8TsA9Zk6ZOb6gFlocC6fYHUQa4N/1FQ0neTHWW
 yRukiezkRTook5XMqPQ==
X-Proofpoint-GUID: wxoDCUIzkP2Ang_3m21-fcReUmDJPeTs
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a100b26 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6TMII061o9s9I29nBW0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wxoDCUIzkP2Ang_3m21-fcReUmDJPeTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109194-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD78C5B03A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/2026 8:20 PM, Dmitry Baryshkov wrote:
> On Thu, May 21, 2026 at 07:50:30PM +0800, Yongxing Mou wrote:
>>
>>
>> On 4/12/2026 2:07 AM, Dmitry Baryshkov wrote:
>>> On Fri, Apr 10, 2026 at 05:33:50PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Add support for additional pixel register blocks (p1, p2, p3) to enable
>>>> 4‑stream MST pixel clocks. Introduce the helper functions msm_dp_read_pn
>>>> and msm_dp_write_pn for pixel register programming. All pixel clocks
>>>> share the same register layout but use different base addresses.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 40 ++++++++++++-----
>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 89 ++++++++++++++++++++-----------------
>>>>    drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +-
>>>>    3 files changed, 79 insertions(+), 53 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 7984a0f9e938..ff506064a3fa 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -85,8 +85,8 @@ struct msm_dp_display_private {
>>>>    	void __iomem *link_base;
>>>>    	size_t link_len;
>>>> -	void __iomem *p0_base;
>>>> -	size_t p0_len;
>>>> +	void __iomem *pixel_base[DP_STREAM_MAX];
>>>> +	size_t pixel_len;
>>>>    	int max_stream;
>>>>    };
>>>> @@ -561,7 +561,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>>>    		goto error_link;
>>>>    	}
>>>> -	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
>>>> +	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->pixel_base[0]);
>>>>    	if (IS_ERR(dp->panel)) {
>>>>    		rc = PTR_ERR(dp->panel);
>>>>    		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
>>>> @@ -769,6 +769,7 @@ int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display,
>>>>    	}
>>>>    	panel->stream_id = stream_id;
>>>> +	msm_dp_panel_set_pixel_base(panel, dp->pixel_base[stream_id]);
>>>
>>> Hmmm.... Would it be better to set it up differently? Allocate one panel
>>> per the stream from the beginning and then simply get the first
>>> available panel when required? This would require some minimal resource
>>> manager, but then we won't have to pass dummy register base to the panel
>>> code. Or actually allocate a panel when it is required? Do we need a
>>> panel before atomic_enable()?
>>>
>> In this series, panel come with MST connectors, Because the connectors are
>> dynamically assigned, we don’t know which connector corresponds to which
>> stream, so there stream_id and pixel base address are dynamic.
> 
> I read this as 'streams are dynamically assigned'. Connectors are fixed
> and created for each branch point / real physical connector. Streams are
> assigned on the first-serve bases.
> 
Thanks for pointing that out — your statement here is accurate.
>> we have 2 optionals here:
> 
> What is the runtime requirement for the panels? Are they required for
> parsing of the resources or only for the setup of the actual screen?
> 
> If we have 5 monitors connected to a single DP controller (via the
> complicated topology), how many msm_dp_panel instances do we need to
> handle the case, present it to the user and still let it select only 4
> of them for the video output?
> 
It seems that if we move the link-related resources from the panel into 
dp_link,
struct msm_dp_panel {
	/* dpcd raw data */
	u8 dpcd[DP_RECEIVER_CAP_SIZE];
	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
	struct msm_dp_link_info link_info;
...
}
  we would only need to assign the panel during atomic_enable / 
atomic_disable.
This way, in the scenario you described, only the final four panels 
would be exposed to the user.
In the current implementation, the panel contains link-related 
information that is required during the link training phase.
>> 1.panel come with encoder (after bridge remvoed), like that:
>> struct msm_dp_mst_encoder {
>> 	struct drm_encoder *enc;
>> 	int stream_id;
>> 	struct msm_dp_panel *dp_panel;
>> };
> 
> This sounds like a good idea. This way there is no additional resource
> management, etc.
> 
>> 2. During enable and disable, allocate and release dynamically.
>> would you prefer which one?
>>>>    	return rc;
>>>>    }
> 


