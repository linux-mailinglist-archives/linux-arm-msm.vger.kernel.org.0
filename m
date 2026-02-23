Return-Path: <linux-arm-msm+bounces-93831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAoOIOjQnGllKQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:12:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4EF17E123
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 23:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E67AF30338A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 22:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8461379980;
	Mon, 23 Feb 2026 22:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l74upXwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXTHiZBN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911737882A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884760; cv=none; b=dZlLoIw/ZGKS/k8sVdgX2p4YCy0E6/FldASQ8l2iLMhmHZx1nJzSgwPUMJxTwBGtU8/XubV7cEPY1Z3JChGDTyoTQCCgyx8tmepNTDkYfjK5FZz/nMmOJUDtdhGCmI7wLpOGTh6FfnE0yE2OcyYE7tlxJbcEqB2TGjUIgDc+PBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884760; c=relaxed/simple;
	bh=Xmv6AivAPcyN4oojDSQhWKjUpiZH47TkKPpC0QkmJxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsg5NU9b7sbRnwcWAR4P0JJLKci4ozbIfSEA0IJJm30rKbnic/DvjhCRjsqQIaGKJz7UDUegTEIvKFh/AGnq20Gvu83rJxASEe1DYEnryszocEblUiSmiEyc+akFlnzmuViDgB29LAwQnzrPCcyrLd8B3W1Mm7DX8I8QLakAj1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l74upXwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXTHiZBN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NH4Hjm910194
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U8+99t2Q08+ketqYxwhfTfYr
	syyINxyz6SnBAR9Q/Mc=; b=l74upXwGKe5nvGSpUt5Sr+jvI1kN0EmQQJwIkT/f
	5rtolmxcSheWmP6r/BFNpA2OevUrbWJ+NAkmQcD4GHilDIXCkTUhHpz27O9z1yFC
	CBVYpIojePUWbaaugRyAZVBDVzIaLJN9nUYCw+bziNJV6OtlW+9iGCmq98a2W/ER
	NeBaHDaTESG+IjXV4SYxQKbS5e25zYOEnyIUu+lFeT7wKvY2JTB4pqTnN1Cb3IaB
	PqrL3bNhhZr7fM8R7W7/fXm16D96rajTYO7RSnV+Yqg/f+pfsHLHRjXOIwXac4Gg
	W9IkXjkizbIiNY7WGpfiVoICtOTDa1h7TAOVvkHQWdq2fQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtyj8uep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:12:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb413d0002so5282065485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771884756; x=1772489556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8+99t2Q08+ketqYxwhfTfYrsyyINxyz6SnBAR9Q/Mc=;
        b=cXTHiZBNDQ6gr3OaVBaPjDejL/cjg/L1LLkTZt+Bez1N1l+OujOWuEb7xZPmKD4A1x
         cuQKbmoHkQa3A4jA/4GSMO7T0UGvT446DAC7N35Fwn/ZmxBIbJ0VJ7XjfN43YGvgHqhY
         mZ/SI8iPHPKCy/bkEBi0MZzQPn75FigFgpRYWyE0PNU6GYW7Uy/ULqxA6vb2piXP7Ga4
         4DYjpMEq/0zjWtR/bYlRvoZZOaVA+x+zm4tOMBPfJiCdf53FGf0kYUA9vXaSZPCKtZYB
         LFp2LhQa8sJon0OctXr5mku+rHt1eRp7ioYBo2uxlB7NlcfkdRMVtZ01lhNgr205IeeQ
         A9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771884756; x=1772489556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8+99t2Q08+ketqYxwhfTfYrsyyINxyz6SnBAR9Q/Mc=;
        b=dsgyrtcQpbc6w99OelxJZeQns1ODOdHt29BKoR15LFjV3L8IXrbzVGURmwIgTEI/QX
         Q3+jSrDgqKHQTwvGC6qUqkZIJ3uxjJHC6yBMDDko3YcS8IzHPknlZBc3N6lw30RJKYt5
         OobMObubaLGFsaugRSjB+4LcoxUHgFaa1JAaoYhlZxGN+oMYPqCxFJyLwAEImMLM50t8
         Hof7XvazfhY7tqaXt6udb/srUkfYM38wdAbRIn/c77F93p35WdosEC/epL2z8Mb7DEXA
         jaHMav5InAgMhuGurAmv6xfKxsCS6wX5HEY++0h/aF5B27E55hCExMJ9nhZee/NSydmM
         Xa2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVF8O+XzpmzJZ9hpUcpWpyZiv6oOLLsvukxJmWuVPYZ9TqlttcQIH2hsarbFrndXQmU7DfePVcHJ3TvBnSA@vger.kernel.org
X-Gm-Message-State: AOJu0YxCls/N+IjHeTXOWwCToROMHGnSrTXn6kzifpGHKm+ifYF+Fsdw
	wLHR8nZULw7P6f2HR6aF53dkQ+gW5r31WbvmUXD12nH9qocRfyjIN6t1wFcembJiC6NK8z4WmOA
	dekBdsNdUuaB98STY8gv4WZefmio+FPC6swk7KTQjMg6aHn2n7+f3OrKZdtg8C4afnsmo
X-Gm-Gg: AZuq6aJCgOJmodTAgZvgJUhy2jJhi5oRbmIsYAggXeFLkJKRcHF/SmRvr/KU7HWksnS
	o35UPccx2auPUPi3v5Q4yuyBEgk8/hyx+iLONUEgmlNaHm8FSEQ4FdehQ5n+MfZZG7+bwnF+fAz
	JoP9Fw6y7N3fWhKJoZWP1vmlW5J+vUmJ4Kr+rltaBTaVTlzdFq3sPXewEf+1VfIb5R6xB9AUS4w
	iPAK8HCdrsZq0A8sNPZ7E3LyuKCpQrg4KPMqSNj8Z+peSsvMWlTY3TV5tQyD6+/xZfkIHf+r2Ss
	7znbzqfyUFkPHX2ljZ8wvZk1vF/HahS7CRUlQo0/1WOpEddQQJ+rVvZ8TAx0N11xaFuVfOpML1L
	Z6KGYsUMad9rJJnXp3DAD4msfHoX4Zngcq6LvMAUuI2P6jtZG230o/uf65nBKC6EJH1EID5l7CC
	FxriQlndEugOgmVyLyBRvHqi+aitkA5W4oPEI=
X-Received: by 2002:a05:620a:4441:b0:828:faae:b444 with SMTP id af79cd13be357-8cb7bfc8d06mr1818109385a.20.1771884756289;
        Mon, 23 Feb 2026 14:12:36 -0800 (PST)
X-Received: by 2002:a05:620a:4441:b0:828:faae:b444 with SMTP id af79cd13be357-8cb7bfc8d06mr1818103585a.20.1771884755417;
        Mon, 23 Feb 2026 14:12:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7aaed3esm18805261fa.40.2026.02.23.14.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 14:12:34 -0800 (PST)
Date: Tue, 24 Feb 2026 00:12:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
Subject: Re: [PATCH RFC 03/18] accel/qda: Add RPMsg transport for Qualcomm
 DSP accelerator
Message-ID: <r7eko65ua2ofyejqf6ipnh6jm4s76f4mqy6a4msgmlraz4xuec@uymfzc65dbng>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-3-fe46a9c1a046@oss.qualcomm.com>
 <tqsdbijgjomrn7fq3sdz7v2axwxqvbccpjh4fmvod4kbrq7pod@af3igw5dx66p>
 <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lyco6vkfjlerri55ldyn6fbhihbkhnuolifddcnscevybsztq7@ljhjln2ynmid>
X-Authority-Analysis: v=2.4 cv=Jq/8bc4C c=1 sm=1 tr=0 ts=699cd0d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=WRMiGO0D-mV3MfwFjRkA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: tYwJ_M63FnIf9sTzmrLUOX0Nut8soYv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE5MyBTYWx0ZWRfX+C/stp74E3HE
 WVph7rLTmqHiGw089PMHD5oTOUDo5ALP75bi2V8UlqS77u9yPZd5V/sJQPllhAXclIzBzai7ZPX
 mo6Ik0wIU0AeVrGi7lczrECdue/o1rfn42fhnr63JBXzXMx+VZMpH+DdJnC4Pthvb9i7NpOeNaL
 NnEAlOILTCkO3DIsytUtcXGOdZXkdrwzpVFq8WTuCzbBYNJxbGYyt9q32FUVrNe6N0NXNFKyzXc
 wwB4jlcpSoqDQVUZiXwokbwSVeS2knvy+Um5PpsjhahsgMLaAmXMTGq+uMECTSlW7YnjijUjX0K
 qRq6ntJmX7BjikdE9oC61aEfB3baC20Ap1EPtjhYhOSdAn3fPZBPpq8b18jAqiYPylAW/AtPIXO
 oYgPxlE7HX2oJldp32eKbCgjhYVr3ZAKAxgmbM7I38CY03/Kb7qdekiMQTvLXF1fYNhz9l/CIna
 a7/SZiDwJhmv6zkhUjQ==
X-Proofpoint-GUID: tYwJ_M63FnIf9sTzmrLUOX0Nut8soYv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_05,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230193
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93831-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D4EF17E123
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 03:50:32PM -0600, Bjorn Andersson wrote:
> On Mon, Feb 23, 2026 at 11:23:13PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 24, 2026 at 12:38:57AM +0530, Ekansh Gupta wrote:
> [..]
> > > diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
> [..]
> > > +/* Error logging - always logs and tracks errors */
> > > +#define qda_err(qdev, fmt, ...) do { \
> > > +	struct device *__dev = qda_get_log_device(qdev); \
> > > +	if (__dev) \
> > > +		dev_err(__dev, "[%s] " fmt, __func__, ##__VA_ARGS__); \
> > > +	else \
> > > +		pr_err(DRIVER_NAME ": [%s] " fmt, __func__, ##__VA_ARGS__); \
> > 
> > What /why? You are under drm, so you can use drm_* helpers instead.
> > 
> 
> In particular, rather than rolling our own wrappers around standard
> functions, just use dev_err() whenever you have a struct device. And for
> something like fastrpc - life starts at some probe() and ends at some
> remove() so that should be always.

I'd say differently. For the DRM devices the life cycle is centered
around the DRM device (which can outlive platform device for multiple
reasons). So, please start by registering the DRM accel device and using
it for all the logging (and btw for private data management too).

> 
> Regards,
> Bjorn

-- 
With best wishes
Dmitry

