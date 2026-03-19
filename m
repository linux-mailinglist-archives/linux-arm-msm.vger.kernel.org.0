Return-Path: <linux-arm-msm+bounces-98651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDzeNfCmu2mUmQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:34:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D767D2C7525
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 08:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5679300E6A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725023A169A;
	Thu, 19 Mar 2026 07:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IvOkIInU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0F43A1680
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773905642; cv=none; b=FNDAGoIcrHZ9LA+yS+BTto/p7jPjgdow9vDy5BohtgseG59yv/7eiT41T6i7c9gyWPtN9My3IQyZK2GtQaVrBrlquZViDH+ANNnWNFdgk6RAw17/g9vTq9AO82My2bQO6pqUPnx7fv54SudiHqpxHhrh42NKoOPiD4APxSA2dM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773905642; c=relaxed/simple;
	bh=AhNDDZecnmD2xFm+TNWATlQbxsUvN8KlFepA01COIwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j251cJEAbPnRRIdctZSplN8NkcEIplWdlxmDwL2qkg9yMrHWWFt5jqZgIw5pktRPoRO+kAT3NrkhsuEYC4eJeWcIpKR8dryFEnnBzKs/MNkihrd9N+GOcmB0me7GeXGcPycoWLADsvMSn1UmcGMvTFEeWCCNvKnuqQviPi6cK1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IvOkIInU; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439fe4985efso441604f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773905637; x=1774510437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfnoZII81lwHDQG+q8k3CqLmv9bwI5/ooG/r2BOJypo=;
        b=IvOkIInU/YzZLqaHZgSxaRamre1CKdkvdI70PFUfeH49IfziLVMMlBx8JBwXExRU+I
         gVRhh17h9JfspgTMMC/rrvpb6csmLx8UMmMITDH5bpFdSylsCAMhN1Lb8AzT8GzNRKmr
         N+tZrhu9OWY5JmnPNsVUJjwjoIu07UIG/l/+kGr0XiojwstpSLa9eE3RBkwl3qeFJmxu
         t0lzdAmp1R867dvF3FnUE6WLp2dQXwUnWLam6WCwjp8wJ6DKtsj1brcR/9puwlQMk37V
         sffUCzBXmHbcM6FgB8e0rvmV9AhfAia6M6odtwKzHbGlQfiiTnQpney5fyj3ZKr3Mj/L
         UTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773905637; x=1774510437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfnoZII81lwHDQG+q8k3CqLmv9bwI5/ooG/r2BOJypo=;
        b=ADYzEkAjL9h4wuLiZ92d3/KToAiCACCs6zVYOI2WZdG3gkyQOe6INwm9dJyl+BGiw2
         ocXMYm0oX1irPPaU77JvPhjirm6qMDWFiM4d6VMzEJ6NTeKgxW69Ejx6LSBnaqtif/LE
         expAMZbuTqXqhb6yLZdlLdXp1y7pCcH6KwGKAlNdKNyfV6/Rm+eU3lIHMSoUOSQGgehg
         +eOA/1u1UzB1zqZp8fLzP/qkl7zvqdZYqnpYk5LF4hLPu+1r/0pUB6wEvINzykuyHuoi
         5pHv3RF52uzGghEHdrjXx7GyHb2BWg0AofDkDWB1W7tglpATzkf0PoVIyFpqa8OjiGEf
         DIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWddzubHx5RO1EPyvO9bzVAiGcieleAvuaQ+tbxugvvIubl7O8YlUTtOA55dLIJ0Q0b0pFNdw+HJL5ywMQ0@vger.kernel.org
X-Gm-Message-State: AOJu0YwNEyKucK0MbIeLDe+5c6kvQgohRbyf5N0/2xKa0GZBYnLmI6fO
	WtqEJxoPHYg+hh6iXfzNOBSFwZKrDOYYXkp821MT0ZaGBwWfUo9Zj5qgfnLoDe2UPLg=
X-Gm-Gg: ATEYQzz8DdPbS+yWhDqIPrJliGKs93D/oRvxHDRyrTz0K/95LcGl8FEo41WcqB0jhXj
	4O5ZPRzNfu0YLsuDkAloAF5IgoMZvhBPe2mATC0w2c4REq05zS3fbQ4WUsOw4yWtn95UH+AzbGZ
	WfZPxsYGf71Jm68j0fcypeK+dtVjdDIV6qapTWH6juBHHaACrFXlcUhAvzdHrKM3fepxt0FnxK2
	eP/aP+iSU8al0lMq/BIAYf2cOac2qTKqy5YXwcJVAGvU1NgwXSsaCjyBVfzX4P7/pdLwmgE1Ns2
	aU4nAyOCMG7twUOQ6lBAuronb21bWnp2OLmSDK08nMFv0v3YyPMz24dJikQV4/2+qFWJRvBIK5T
	yWMxlPGgy4x0mommEiuKKpX/yklVEIzX2r9hgmqJ3Aqv3szrCXlo9sqNYG2gi2WHB+LEF3I7gVL
	iwIaXdgZ6m/5BB/Lnu1aO1rU0tHE1reRQ=
X-Received: by 2002:a05:6000:25c6:b0:43b:4ae5:d7c8 with SMTP id ffacd0b85a97d-43b527a50cfmr10368836f8f.2.1773905636943;
        Thu, 19 Mar 2026 00:33:56 -0700 (PDT)
Received: from [192.168.0.34] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51899622sm15875212f8f.28.2026.03.19.00.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 00:33:56 -0700 (PDT)
Message-ID: <46c47101-2672-4970-a212-71e2c8555d80@linaro.org>
Date: Thu, 19 Mar 2026 09:33:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/25] Introduce meminspect
To: Bjorn Andersson <andersson@kernel.org>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
 <abdnp90cC5PI9wyz@baldur>
 <20260316181647.m7x4ncmwdjho6yvr@hu-mojha-hyd.qualcomm.com>
 <abtlUQqMOxj5PwGB@baldur>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <abtlUQqMOxj5PwGB@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arndb.de,kernel.org,gentwo.org,linux-foundation.org,infradead.org,linutronix.de,redhat.com,linaro.org,arm.com,goodmis.org,google.com,suse.de,oracle.com,suse.com,cmpxchg.org,nvidia.com,tencent.com,huaweicloud.com,gmail.com,lge.com,chromium.org,vger.kernel.org,kvack.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-98651-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eugen.hristev@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[56];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D767D2C7525
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/26 04:55, Bjorn Andersson wrote:
> On Mon, Mar 16, 2026 at 11:46:47PM +0530, Mukesh Ojha wrote:
>> On Sun, Mar 15, 2026 at 09:24:39PM -0500, Bjorn Andersson wrote:
>>> On Wed, Mar 11, 2026 at 01:45:44AM +0530, Mukesh Ojha wrote:
> [..]
>>>> , to get all the regions as
>>>> separate files.  The tool from the host computer will list the regions
>>>> in the order they were downloaded.
>>>>
>>>> Once you have all the files simply use `cat` to put them all together,
>>>> in the order of the indexes.  For my kernel config and setup, here is my
>>>> cat command : (you can use a script or something, I haven't done that so
>>>> far):
>>>
>>> So these need to be sorted in numerical order, by that number at the end
>>> of the file name?
>>>
>>> Do you manually punch these in? How do we make this user friendly?
>>
>> Yes, manually.. but I think we can do better. We could make
>> this more user‑friendly by using the section header and string table in
>> the md_KELF binary both of which existed in the earlier implementation.
>> Then, we can write an upstream‑friendly script that reads this KELF
>> metadata file, checks whether a binary with the registered name is
>> present, and stitches everything together to form a complete ELF that
>> the crash tool can consume.  Let me know if you have any suggestion..
>>
> 
> Can we somehow identify that these regions belong to the minidump and
> teach QDL to build the ELF for us?

We could integrate the feature that Mukesh suggests directly into QDL as
a separate command
e.g. qdl download-and-build-minidump

The first region (the ELF header) is mandatory, because all the regions
themselves contain only data. To be able to use any of the regions, one
needs to know at least the physical and virtual address of that memory.
And this information is saved in the ELF header.
So QDL could join together all the regions into a single crashdump-like
file.

> 
> Regards,
> Bjorn


