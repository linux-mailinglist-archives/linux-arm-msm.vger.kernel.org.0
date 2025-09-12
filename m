Return-Path: <linux-arm-msm+bounces-73387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D724B5578C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 22:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF233AA1DD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 20:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5485EE555;
	Fri, 12 Sep 2025 20:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dpFzoYMZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541A2C0285
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 20:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757708467; cv=none; b=mR9FQ3hqy7s89uepXzmwJ8LEEx/rdlu7t4MvZHZCRkLqpXA/j2+oaoxIIM30WLa4G8wqy7BH5YeBUeUrLbuGPFtzETUGkRTuDysmzu3hrNS2oiQ0KgMnBX+sYx4FGI5tAS8P3BtG7utUS/cye5QWpWPGIrTrGM41saFHHOi2WL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757708467; c=relaxed/simple;
	bh=ha5sACqI+T93S9hNt+6tg8vEBhnD3jRHwOofYElvPzs=;
	h=Message-ID:Date:MIME-Version:Subject:From:References:To:Cc:
	 In-Reply-To:Content-Type; b=fEr5ErZWrDkAwLOJ+MXHeMQscXM07TwweTEoo+KnK2LyOgNnebUsMbbFxUpjzd/Qd5y4qrZD6JCiImN7ta2pxUVJQtfaeR1Tt2Ay6WFj0qSR8Jrpnt5tUfHTzaXFOF67X82AEx9tsWJtmHWtmuCOn4H2l4nDazyq892Am9kuhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dpFzoYMZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CHjFaD009081
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 20:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uh8HWFGgvQRh4YRN3fk73qzhec8r9FEUaHUe0C5PvU0=; b=dpFzoYMZG1v/fuZZ
	2RiOHciNexepsOY2/E+q6hirgSIhID69Ou8BV9gf506j3uZg5Eyg1aOZTn3HJATt
	izsRV0N8KIa63NihYzi/wdKIsjrvo3Q9Mstv6cveN0mG9y+W5uIkQAuk5nZ7SffF
	SCpZcWhk1ehi5VrtLFFghTgdwVZiKX9kSYL7uICiT22ybmcz6YAkKtxsSRmAe46V
	WsgpfZhH7ssf6RKCR/Cv3ITFT9Djgj10pxJzXJdkSQCZfcpynUiSJu1TjunZY4Tn
	gHQFfBhtAm14Oyd3GlqhuFqV543caaNYYs6ltXn6svrV/nHakTrpOIqeRsCGuK+w
	BSNxYw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj14r3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 20:21:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-772537d9f4aso2004416b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 13:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757708463; x=1758313263;
        h=content-transfer-encoding:in-reply-to:cc:to:content-language
         :references:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uh8HWFGgvQRh4YRN3fk73qzhec8r9FEUaHUe0C5PvU0=;
        b=hq3JLVT6QHIXCviTSPMwqCgeNtNLoLaJcMfSsfOetX9RbihG7cGrCq50qKdWQRj/Hr
         gyVccuLvY45Zk6qCCQ1Nc2ZwV3gf9PCg690ZckzoA+RMk0+iRgoKAsfKcTm5AZNdbp4U
         1Syi+wfBpcbmzubgzDE1f1pZ22JavUj+5CkfpLI1/ADQMH9YHya+TUEtEupkyQRMPEE5
         gBm8YGpOPaBMFiSTaxCZ5JLUNYC+atFWLreTzZHW9Ey1XofZaQEVMacffrXEFYv23GyR
         3D55XSitnKYP4M6x4to5ayaQfqsPjLSBtUDTs+VkkvRx+DCJltj2bezg1H5NGpqanf+1
         Ao8A==
X-Gm-Message-State: AOJu0Yw0TIhMVMTqOACSpmMYim29dTfBdbeyUtq3TfIRDKzhSg9pIbDR
	CRwM4N2AtinPlmufD/QwKT6vnKqY/iqdw+acmS9msrayQJ7bJQ2YnYjDusbqMCxHeoj4PnR8eUy
	QmaCqKYJP3QzFylCP42BSpwcf4FP6nP7UUZuknusK0bQX7dSFQqcwBE9DZ+nvCKgY5sS8
X-Gm-Gg: ASbGnctfdmXWFRA6uyC+WrNzwj7ZMcilQjWh9LpkOpeEhyfzr+KNbsEKP0j55NNh5gG
	9cGAI6Zqy7L88SO0gsV8FVnRG4P65eCgDKE7YgV5VTMq6e9Befvsj6AzGvNrbC5WsCjio6zCjgD
	Rm1Kct6ec9IGZKFhePyRGksOY6Yj/N9Wty37aU5MzwdG5VJdonQpLmBtnVqRLjD5L/GQbZI1WDg
	y6BGCd2uOwJ1Vf9lZy6bAKd6WSImXpHu6mxlyB0wFQNwJKbFNxNd4rH/76haBecp/Bhz1/rhouT
	UrwZUPiF/IzK8+FVXFR3cuYZTY/MU9L5OYpZf/cQbIiRVzud0Q7+j1TQymULcvjOa+uH1Hbr0JT
	LwZs9395kvYlFl5RvpkqtVDw=
X-Received: by 2002:a05:6a00:181e:b0:772:48c5:c75a with SMTP id d2e1a72fcca58-77612091649mr5033557b3a.13.1757708463022;
        Fri, 12 Sep 2025 13:21:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy9rA89rMg5iy1ZfZgFDowhXAj7A+YF9TJ6xmj3kp84CbPWPd2rihyHVZcOIc16agMz/VevA==
X-Received: by 2002:a05:6a00:181e:b0:772:48c5:c75a with SMTP id d2e1a72fcca58-77612091649mr5033517b3a.13.1757708462327;
        Fri, 12 Sep 2025 13:21:02 -0700 (PDT)
Received: from [10.110.61.161] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a46eedsm6317156b3a.30.2025.09.12.13.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 13:21:02 -0700 (PDT)
Message-ID: <86bbc54c-3fc9-4c6d-9f93-b684634121bb@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 13:21:00 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RFC] PatchWise: Unified Static Analysis for Kernel Development
From: David Gantman <david.gantman@oss.qualcomm.com>
References: <3aa87758-1899-4f7c-aa17-2330e656a467@oss.qualcomm.com>
Content-Language: en-US
To: workflows@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <3aa87758-1899-4f7c-aa17-2330e656a467@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cMHmUXivf9-DSwKzbzpQLt6lE5LIXiIR
X-Proofpoint-GUID: cMHmUXivf9-DSwKzbzpQLt6lE5LIXiIR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX/C9Xw5pfMpok
 3EePS6G6jYi/t7Ht8vNun7KwqtTJFsxRba4aZ24QFlox7zF0fWnK+EOhq/n7d+ix1rb0ejUeMTP
 GfzYXVx/8uvA6MX23BXLzxBuTr4gr+BW/y+YiIXWCiMIBNbkxI3KwBes1AYwOj3BlmfY/BHXpB2
 Qur3qcSfMjO5cz1BsM9BzZR5JOZwc2jkQ1fr6xP4vpE2J4suR3m1PydcjFTzmbtDC1AxnZKuT+o
 o42Je+2jQhPPeKBtgGKg3rXWY7HpLMc34FrIsRXtukHwYFI5UlIWZSdgDAOl6StvBNijJ8n2Bck
 KxqCc86GJgp8drgkrXrUaxOBUqNRJCygaZ/fSzG6j++mTmUkDXInP610dZr37sFDjgzo0e0aPvH
 3GtUiMjU
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c480b0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=_2PzejVuNbwBRFFAgkYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1011 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

Kernel developers and maintainers often need to manually run
multiple static analysis tools (checkpatch, coccicheck, sparse,
dt_binding_check, dtbs_check, etc.) and create custom scripts to
consolidate results. This leads to:

- Inconsistent testing environments across different developers
- Time spent writing and maintaining custom integration scripts
- Missed issues due to incomplete tool coverage
- Difficulty in reproducing analysis results

I'd like to introduce PatchWise, a tool designed to address this
fragmentation and manual orchestration of static analysis tools. I'm
seeking feedback from the community on this approach and suggestions for
how it could better serve kernel developers and maintainers.

Key features (All Optional and Configurable):
- Unified interface for checkpatch, coccicheck, sparse,
dt_binding_check, dtbs_check
- Docker-based execution for consistent, reproducible environments
- Simple installation and usage: `$ pip install patchwise` then `$
patchwise` in your kernel tree root
- Allows selective review execution (e.g., `$ patchwise --reviews
checkpatch sparse`)
- Supports both individual commits and commit ranges

Optional AI-Powered Review Features:
PatchWise also includes optional AI-based code review capabilities that
aim to overcome a key limitation in automated patch review: limited
context. When enabled, the tool uses Language Server Protocol (LSP)
integration with clangd to:

- Generate compile_commands.json for accurate code understanding
- Fetch relevant function definitions, struct declarations, and related code
- Provide context-aware feedback rather than superficial pattern matching
- Support multiple LLM providers (OpenAI, etc.)

Important note: All features including AI code review can be selectively
enabled and disabled based on user preference.

Technical Architecture:
- Python 3.10+ with pip installation
- Docker-based isolation for tool execution
- LSP integration for deep AI code understanding
- YAML-based configuration
- Rich logging and debugging support

Source code and current status: https://github.com/qualcomm/PatchWise

Upcoming improvements include patch series support and Docker-based
dependency management for each tool. Open tasks and planned features are
documented in the GitHub issues for visibility and collaboration/

Feedback Requested:
- Tool Integration: Are there other static analysis tools you'd
like to see supported?
- Workflow Integration: How could PatchWise better fit into your
existing development and review workflows?
- Output Format: What formats would be most useful for your use
cases?
- AI Features: For those interested, how else can AI code review and
commit text analysis be improved?

Try it out:
$ pip install patchwise
$ cd /path/to/your/kernel/tree
$ patchwise  # Analyzes HEAD commit with all available tools
$ patchwise --reviews checkpatch sparse  # Runs only specific tools

The goal is to eliminate the need for custom scripts to consolidate
kernel test tools, while offering optional advanced features for those
who want them.

Thanks,
David

