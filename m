Return-Path: <linux-arm-msm+bounces-99861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNgqJX3Mw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:52:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EEB3243F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DB46307ADAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E510D3CFF5C;
	Wed, 25 Mar 2026 11:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqDb8+pg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Py2mZPrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407C13CF696
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439121; cv=none; b=r+LxPCNbIF7kHZaLuLXnme6RRj7a0JpJi6xdAsntaIk0mMrXJBJ4ZtyyZjKCeTiWnj2FT4t/YaFnGd6z3uOoiHzkswy9AK6VZNbIGrj8UDafwxGV068WYPc5mqUmVOoIHx+NDD288ZCZGJrNQGPGyQGMA9iu1rJ8eywh7QSFqPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439121; c=relaxed/simple;
	bh=VeDpg5H3Mu1ymhqFJARxM/ReOhJ8aSS48B4t1KpwAfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRFnoh/ntbQJseuCAmZAsJA+j5d5Qr9JS/cFKnsmwvStRVBuGMbwYAD+Nbrmbzc/u79YSWbEBXfc2oOpzA4qKljLbMBKcX927HVjv2cXeeaf47/5djaEvTyVLYy5SO5L++4eJrGGrbGlV5nIdJYqo/MlZ1mot0wq6VyLgRinreY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqDb8+pg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Py2mZPrT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG7uj2993756
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNU90VtVCZvNVrVMZ9CCy3RANpzV2GHcpjLzCXdmjpQ=; b=LqDb8+pgRIqCCE4N
	DmDsucvK/TYExS/xoduEj8FVcv5XkNAj8IfdmqbLZ4SquUd007a3IGYl0HtEuv89
	6r5YUJ5r3JjWZ0H9fv3TwTa0qbeIwUlfDmzms26b+8gq8NMkc2cz1NG/ZkAofiQu
	WP+9lzQsOJohWqFBlyTmHFQ8ppjNuRUx5FM0NnXaRRBjP3crHOAZZnCwUwEzWk3b
	B13hSt7E1X9jHQGg0Gp9vAJtSh+4zHWm0gyiZyY6oiPVzW8JkVetdZAk+Xpy/Q9w
	GOEBBlzOkPf0PBhsSgfh4oJoTL+jX9gcUSuiHc/yRHZnXozO8CoYtaubKVdkKy56
	i8ZK/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4g8q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:45:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso34384821cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774439118; x=1775043918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iNU90VtVCZvNVrVMZ9CCy3RANpzV2GHcpjLzCXdmjpQ=;
        b=Py2mZPrTEakojYJbBHrIzsnQvsf3+vaDGPnsBGVTFDlQvL4xxGZH2QSEMQ2DruGi+v
         PyUiTa4/+y5KcFQhZK7YlsWeDi05zlK+sbnPHGLg58Wg4N+qqHGlNHge09YGcqDhJROv
         pmyxf18XucGCi5CyMnwwOCS6UttwAwBOcG6U8k8es5+br1dqYM/tj5Kg+HECKS7dWTuN
         inCDuyyTp0SD5nxi96PLV7xYKn6sD2Ozn8Yf40GEuaTTc/lpuctVaFbZCLRs9uaa84kJ
         evYA9WbjYGPnIX1GwIDwOc1JqNGBnQkyTZPxkAs9hOX5gxHoFkDcktzW1cqjGUyXAbJz
         V3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439118; x=1775043918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNU90VtVCZvNVrVMZ9CCy3RANpzV2GHcpjLzCXdmjpQ=;
        b=D82fW6Ted893Wc2qLKRWSDnDP5vd72X/T8UW6C0ufC+9VNFJTKdKYyidAbcDbpBcP1
         PMQc7LqVvCdQqYaBWmbzj0ZGcV8rnjDCOAuJiZv22kS1SRTjqLlwxdpmVL+Pel8Sjmkw
         cwhxBgvFPZoXXMHHWdczmpGlrHg2GNOY1kZuAzNl57Ki39yi+9NIDHze0HnezNUNHvUd
         aX2FM9v1DRqZvMvajpR38RySg5ZJkl2YdjxRTn903B+8L+hylHSuETCfnfrsgKqB5JHc
         LgTd87J5JQGOCz3GLJq+wouDSR01k2kEULX7mp06+9RyOJqx5Yms8gSM8/IJPMqkT3IC
         jkyw==
X-Forwarded-Encrypted: i=1; AJvYcCX/sluAm7mHCNYYYol5UY+9Q+nqd6Mo6A2WGEh8G2Y9mgvc+3eGr8QvxL9lqfR5nxixMmtGUsbZchS0pewp@vger.kernel.org
X-Gm-Message-State: AOJu0YySxa8F43Mb5FCSkm0gwKjdFVuVFNyigqFfKQPr2axpL8O7Ab19
	wVoRY+GAl8cVSsOZ2Sxrqqxw/Ulwrm1VoCJZN1qlummou0nDJ7XuUUpF25BTHLeOmovN8n3BI0q
	jmt2G20WWQiJMRFD7kGjE6N/XAT16w1qFyLOHHPvc/U/tfKFaIa56M0Vgaqq0NAlR54Vy
X-Gm-Gg: ATEYQzw5m1Ql7SeuK9elvNfzw0OYH1pyBrI3EbV+o03f2FTUaDmLnenxHsarrvOrTyq
	riKJU+93f033r243m0XPyNqyEELPdaok1NtzeXd94x7JlAZyAMsvHJBpL6Y8WpSCGH96R6GhPLn
	aMV4J5qOYh08S3Kr6tURbF2lYdGNj58/eE1zKT+xhk9F5gV275nqZQ7hr3qUYwR3n5PC0AyMHdP
	VKcLrD9NTltNwMDTBkMO9MYIj8fAn9I2Rh0eXHPX0rpBBbFaSDmblv4lEvgH6mgl4JDeOvbErLq
	efBZNkZw7GPA3D71jqTBFBKd0taxBY+5Cm/5O4XrPb2voP3ueSN0SkEkx24va/TMsQUGEkhXw9A
	fmWPU0CWxZM6O4UpAGAtLPEO4wDqULD2KWbiF9rEPZ74571Er
X-Received: by 2002:a05:622a:a6c2:b0:50b:3e05:5ed1 with SMTP id d75a77b69052e-50b80e445e5mr37759311cf.53.1774439118203;
        Wed, 25 Mar 2026 04:45:18 -0700 (PDT)
X-Received: by 2002:a05:622a:a6c2:b0:50b:3e05:5ed1 with SMTP id d75a77b69052e-50b80e445e5mr37758651cf.53.1774439117600;
        Wed, 25 Mar 2026 04:45:17 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4871a937bdfsm78325945e9.9.2026.03.25.04.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:45:16 -0700 (PDT)
Message-ID: <0f5de4aa-ea9a-4e5a-bbf0-58a18e644b55@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:45:15 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mohammad.rafi.shaik@oss.qualcomm.com,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org, val@packett.cool, mailingradian@gmail.com
References: <20260323223845.2126142-14-srinivas.kandagatla@oss.qualcomm.com>
 <202603250417.fEMbsde2-lkp@intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <202603250417.fEMbsde2-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfX7RjQ4Qcg9aHm
 E3SoAuU2Qw/pUjtEa3RFOeNnwXssfiaqNSr3IxmfwQLOwVF2Vrg0OYXMyNSNmvc5p+sFSfoVnm2
 C5sRc8dfoYetBqyZPmtDdH1Ji5Qxdq50DXlyjpncNr+8dIqeByYv5hj388bJcjmwbEytDQAuVk1
 /CIq356HXwCNpkV+lu5dCDD1Z+w8txd+E+fHr4cd7iH1ZDuA29jEpXZ+Ass2c3upH+3KvoE3c8a
 qgC8zlIHCqje6B2YaT1zHHIOISsM94WR2zeTYQIWr4S842/kLM0vCyNFvvV52/GUWM4QrdJBbbS
 qj8cvPh0S5VwHKK5t4cpY3wjnc1IbiAT8iHXEuJ4Afqs1p0a3RSD1PEPv53yWTRav6W9fOBjQyr
 MyMuZyEl4ooMzFUS7jNglP4/fItYTPniSWYI4RxuiB95SSntw4Rtko+kZS63fxdGEo6Rc6ml5li
 vrVy46dob+af1gdEV9Q==
X-Proofpoint-ORIG-GUID: jkBOYpd3aQciRCztp6scdFbQfStA6ck2
X-Proofpoint-GUID: jkBOYpd3aQciRCztp6scdFbQfStA6ck2
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c3cacf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=5X_j558OWs3QqKC_3BEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	TAGGED_FROM(0.00)[bounces-99861-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,01.org:url,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 32EEB3243F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/26 8:25 PM, kernel test robot wrote:
> Hi Srinivas,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on broonie-sound/for-next]
> [also build test WARNING on next-20260324]
> [cannot apply to robh/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v7.0-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-qcom-q6apm-move-component-registration-to-unmanaged-version/20260324-160527
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20260323223845.2126142-14-srinivas.kandagatla%40oss.qualcomm.com
> patch subject: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer mapping on DSP
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260325/202603250417.fEMbsde2-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250417.fEMbsde2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603250417.fEMbsde2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    sound/soc/qcom/qdsp6/q6apm.c: In function 'q6apm_free_fragments':
>>> sound/soc/qcom/qdsp6/q6apm.c:321:39: warning: variable 'data' set but not used [-Wunused-but-set-variable]

Looks like some last minute cleanup added this warning, will fix this in
next spin, thanks for reporting this.

--srini
>      321 |         struct audioreach_graph_data *data;
>          |                                       ^~~~
> 
> 
> vim +/data +321 sound/soc/qcom/qdsp6/q6apm.c
> 
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  318  
> ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  319  int q6apm_free_fragments(struct q6apm_graph *graph, unsigned int dir)
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  320  {
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26 @321  	struct audioreach_graph_data *data;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  322  
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  323  	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  324  		data = &graph->rx_data;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  325  	else
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  326  		data = &graph->tx_data;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  327  
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  328  	audioreach_graph_free_buf(graph);
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  329  
> ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  330  	return 0;
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  331  }
> ab4c5c6ed2ed1e Srinivas Kandagatla 2026-03-23  332  EXPORT_SYMBOL_GPL(q6apm_free_fragments);
> 25ab80db6b133c Srinivas Kandagatla 2021-10-26  333  
> 


